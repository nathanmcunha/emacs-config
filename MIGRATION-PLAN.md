# Migration Plan: Eglot → lsp-mode + Treemacs

## Pre-flight

```bash
# 1. Create branch
git checkout -b feat/lsp-mode-migration

# 2. Snapshot
mkdir -p snapshots/$(date +%Y%m%d-%H%M%S)
cp -a init.el early-init.el config.org bin/ README.md AGENTS.md snapshots/$(date +%Y%m%d-%H%M%S)/ 2>/dev/null || true
```

---

## Phase 1: Install lsp-mode core packages in `init.el`

Add these to `init.el` BEFORE `elpaca-wait` / `org-babel-load-file`:

```elisp
;; No changes to Evil or other core packages.
;; lsp-mode and friends install via use-package in config.org.
```

Nothing needed in init.el — all lsp packages go in config.org with `use-package` + elpaca.

---

## Phase 2: Replace Eglot with lsp-mode in `config.org`

### 2.1 Remove these sections entirely

- **"Java Development (Eglot + JDTLS)"** — the `eglot-java` block
- **"Modern Web & Polyglot Development (Eglot)"** — the big `eglot` block
- The `eglot-ensure` hooks in SQL section
- All `eglot-*` references in keybindings (Phase 4)

### 2.2 Add new section: "LSP Mode Core"

```elisp
(use-package lsp-mode
  :ensure t
  :hook (((java-mode java-ts-mode
           python-ts-mode
           js-ts-mode typescript-ts-mode tsx-ts-mode
           html-ts-mode css-ts-mode
           dockerfile-ts-mode yaml-ts-mode
           sql-mode) . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :init
  ;; Performance (match your current eglot settings)
  (setq lsp-idle-delay 0.5)
  (setq lsp-log-io nil)  ; set t for debugging
  (setq lsp-completion-provider :none)  ; use Corfu, not company
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-modeline-diagnostics-enable nil)  ; using Flymake already
  (setq lsp-diagnostics-provider :flymake)    ; keep Flymake, not flycheck
  (setq lsp-enable-snippet nil)               ; using tempel, not yasnippet
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-indentation nil)           ; using apheleia
  (setq lsp-enable-text-document-color t)
  (setq lsp-keep-workspace-alive nil)

  ;; File watchers (match your eglot setting)
  (setq lsp-file-watch-threshold 500000)

  ;; Directories
  (setq lsp-server-install-dir (expand-file-name "lsp/" my-local-pkg-dir))
  (setq lsp-session-file (expand-file-name "state/lsp-session" my-local-dir))
  (setq lsp-keymap-prefix nil)  ; we use SPC leader, not lsp-keymap

  :config
  ;; Python: basedpyright
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("basedpyright-langserver" "--stdio"))
    :major-modes '(python-mode python-ts-mode)
    :server-id 'basedpyright))

  ;; Workspace config (migrated from eglot-workspace-configuration)
  (setq lsp-pylsp-plugins-ruff-enabled t)
  (setq lsp-yaml-schemas '((kubernetes . "/*.yaml")
                            (http://json.schemastore.org/docker-compose . "docker-compose.ya?ml"))))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-show-with-cursor nil)   ; show on hover only
  (setq lsp-ui-doc-show-with-mouse t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics nil)  ; flymake handles this
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-enable t))

;; Corfu integration (replaces company-mode)
;; lsp-completion-provider :none means lsp-mode adds to completion-at-point-functions
;; which Corfu already consumes. No extra config needed.
```

### 2.3 Add new section: "Java Development (lsp-java)"

Reference: https://emacs-lsp.github.io/lsp-java/

```elisp
(use-package lsp-java
  :ensure t
  :after lsp-mode
  :hook ((java-mode java-ts-mode) . (lambda ()
                                       (require 'lsp-java)
                                       (lsp-deferred)))
  :config
  ;; JDTLS settings
  (setq lsp-java-server-install-dir (expand-file-name "lsp/eclipse.jdt.ls/" my-local-pkg-dir))
  (setq lsp-java-workspace-dir (expand-file-name "state/java-workspace/" my-local-dir))

  ;; Match your current eglot-java settings
  (setq lsp-java-import-gradle-enabled t)
  (setq lsp-java-vmargs
        '("-XX:+UseG1GC" "-XX:+UseStringDeduplication"
          "-Xmx2G" "-Xms512m"))

  ;; Debug support (replaces your manual debug-plugin.jar bundle)
  (setq lsp-java-debug-plugin t)

  ;; Code generation settings
  (setq lsp-java-generate-to-string-code-style "STRING_BUILDER")
  (setq lsp-java-generate-equals-and-hash-code t))

;; DAP integration (replaces your manual dape java-attach config)
(use-package dap-mode
  :ensure t
  :after lsp-java
  :config
  (require 'dap-java)
  (setq dap-java-test-runner (expand-file-name "lsp/eclipse.jdt.ls/test-runner/" my-local-pkg-dir))

  ;; This gives you: dap-java-debug, dap-java-run-test-method, dap-java-run-test-class
  ;; which are MUCH more reliable than your manual gradlew/maven debug process
  )
```

### 2.4 Cape/Corfu integration note

Your current Cape wrapping of `eglot-completion-at-point` needs updating:

```elisp
;; REMOVE these lines from Cape config:
;; (advice-add #'eglot-completion-at-point :around #'cape-wrap-noninterruptible)
;; (advice-add #'eglot-completion-at-point :around #'cape-wrap-nonexclusive)

;; lsp-mode with :completion-provider :none uses standard CAPF,
;; so Corfu picks it up automatically. No cape wrapping needed.
```

---

## Phase 3: Smart Code Actions (IntelliJ-style)

lsp-mode exposes JDTLS actions natively, so your unified menu becomes simpler:

```elisp
(defun my/java-code-actions ()
  "Unified IntelliJ-style code actions for Java."
  (interactive)
  (let* ((custom-actions
          '(("Move class to package"       . my/java-move-class-to-package)
            ("Rename class + file"         . my/java-rename-class)
            ("New class/interface/enum..." . my/java-new-file)
            ("Toggle test/source"          . my/java-go-to-test)
            ;; lsp-java native generators (these ACTUALLY WORK unlike eglot)
            ("Generate toString"           . lsp-java-generate-to-string)
            ("Generate hashCode/equals"    . lsp-java-generate-equals-and-hash-code)
            ("Generate overrides"          . lsp-java-generate-overrides)
            ("Generate getters/setters"    . lsp-java-add-getter-setter)   ; not in eglot
            ("Add unimplemented methods"   . lsp-java-add-unimplemented-methods)
            ("Organize imports"            . lsp-java-organize-imports)
            ("Extract variable"            . lsp-java-extract-to-local-variable)
            ("Extract method"              . lsp-java-extract-method)
            ("Extract constant"            . lsp-java-extract-to-constant)
            ("Inline variable"             . lsp-java-inline)              ; not in eglot
            ("Convert to static import"    . lsp-java-convert-to-static-import)
            ("Type hierarchy"              . lsp-java-type-hierarchy)      ; not in eglot
            ("Find implementations"        . lsp-find-implementation)))    ; not in eglot
         (choice (completing-read "Action: " (mapcar #'car custom-actions) nil t))
         (cmd (cdr (assoc choice custom-actions))))
    (call-interactively cmd)))

(defun my/smart-code-actions ()
  "Context-aware code actions."
  (interactive)
  (if (derived-mode-p 'java-mode 'java-ts-mode)
      (my/java-code-actions)
    (call-interactively #'lsp-execute-code-action)))
```

### Key lsp-java commands NOT available in eglot

| Command | IntelliJ equivalent |
|---|---|
| `lsp-java-generate-to-string` | Alt+Insert → toString |
| `lsp-java-generate-equals-and-hash-code` | Alt+Insert → equals/hashCode |
| `lsp-java-generate-overrides` | Ctrl+O |
| `lsp-java-add-getter-setter` | Alt+Insert → Getter/Setter |
| `lsp-java-add-unimplemented-methods` | Ctrl+I |
| `lsp-java-extract-to-local-variable` | Ctrl+Alt+V |
| `lsp-java-extract-method` | Ctrl+Alt+M |
| `lsp-java-extract-to-constant` | Ctrl+Alt+C |
| `lsp-java-inline` | Ctrl+Alt+N |
| `lsp-java-type-hierarchy` | Ctrl+H |
| `lsp-java-convert-to-static-import` | Alt+Enter context |
| `lsp-rename` | Shift+F6 (handles file rename!) |
| `lsp-find-implementation` | Ctrl+Alt+B |
| `dap-java-debug` | Debug (Shift+F9) |
| `dap-java-run-test-method` | Run test at cursor |
| `dap-java-run-test-class` | Run test class |
| `lsp-java-move-file` | F6 (Move refactoring!) |

---

## Phase 4: Replace Dirvish/Dired with Treemacs

### 4.1 Remove Dirvish section

Delete the "Dirvish (Modern Dired)" block entirely.

### 4.2 Add Treemacs

```elisp
(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq treemacs-width 35)
  (setq treemacs-is-never-other-window t)
  (setq treemacs-show-hidden-files t)
  (setq treemacs-follow-after-init t)
  (setq treemacs-project-follow-mode t)
  (setq treemacs-filewatch-mode t)
  (setq treemacs-fringe-indicator-mode 'always)
  (treemacs-follow-mode t)
  (treemacs-project-follow-mode t)
  (treemacs-filewatch-mode t))

(use-package treemacs-evil
  :ensure t
  :after (treemacs evil))

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config (treemacs-load-theme "nerd-icons"))

(use-package lsp-treemacs
  :ensure t
  :after (lsp-mode treemacs)
  :config
  (lsp-treemacs-sync-mode 1))
```

### 4.3 Update keybindings

Replace all `dirvish*` references:

```elisp
;; Explorer (E) — was dirvish
(my/bind-leader "E e" 'treemacs "project explorer")
(my/bind-leader "E ." 'treemacs-find-file "locate current file")
(my/bind-leader "E f" 'treemacs-find-tag "find tag")

;; File sidebar — was dirvish-side
(my/bind-leader "f s" 'treemacs "sidebar")

;; lsp-treemacs views (NEW — not possible with eglot)
(my/bind-leader "c s" 'lsp-treemacs-symbols "symbols tree")
(my/bind-leader "c e" 'lsp-treemacs-errors-list "errors tree")
(my/bind-leader "c h" 'lsp-treemacs-call-hierarchy "call hierarchy")
(my/bind-leader "c t" 'lsp-treemacs-type-hierarchy "type hierarchy")
```

---

## Phase 5: Update all keybindings

### Replace eglot → lsp equivalents

| Old (eglot) | New (lsp-mode) |
|---|---|
| `eglot-code-actions` | `my/smart-code-actions` |
| `eglot-rename` | `lsp-rename` |
| `xref-find-definitions` | `lsp-find-definition` (or keep xref, lsp hooks into it) |
| `xref-find-references` | `lsp-find-references` |
| `eglot-java-organize-imports` | `lsp-java-organize-imports` |
| `eglot-shutdown` + `eglot-ensure` | `lsp-workspace-restart` |
| `eglot-help-at-point` | `lsp-describe-thing-at-point` |

Update `my/smart-lookup` to use `lsp-describe-thing-at-point` instead of `eglot-help-at-point`, checking `(bound-and-true-p lsp-mode)` instead of `eglot--managed-mode`.

### Debug keybindings (dape → dap-mode)

```elisp
;; Replace dape bindings with dap-mode
(my/bind-leader "d d"  'dap-java-debug "Debug (attach)")
(my/bind-leader "d t"  'dap-java-run-test-method "Test at point")
(my/bind-leader "d T"  'dap-java-run-test-class "Test class")
(my/bind-leader "d b"  'dap-breakpoint-toggle "Toggle Breakpoint")
(my/bind-leader "d c"  'dap-continue "Continue")
(my/bind-leader "d n"  'dap-next "Step Over")
(my/bind-leader "d i"  'dap-step-in "Step In")
(my/bind-leader "d o"  'dap-step-out "Step Out")
(my/bind-leader "d r"  'dap-debug-restart "Restart")
(my/bind-leader "d Q"  'dap-disconnect "Quit")
(my/bind-leader "d l"  'dap-ui-locals "Locals")
(my/bind-leader "d e"  'dap-eval "Eval expression")
(my/bind-leader "d E"  'dap-eval-region "Eval region")
```

---

## Phase 6: Cleanup & validation

1. Remove `dape` package (replaced by `dap-mode`)
2. Remove `eglot-java` package
3. Remove manual `my/java-debug-test-at-point` (replaced by `dap-java-run-test-method`)
4. Remove manual `my/show-java-debug-log`
5. Keep your custom functions: `my/java-new-file`, `my/java-go-to-test`, `my/java-coverage-*`
6. Update `my/java-source-root` and `my/java-current-package` — these are lsp-agnostic and stay as-is
7. Run validation:

```bash
./bin/validate-config
emacs -Q --batch --eval '(setq user-emacs-directory default-directory)' -l init.el --eval '(message "Startup OK")'
```

---

## Execution order for the agent

1. `git checkout -b feat/lsp-mode-migration` + snapshot
2. Edit `config.org`: add lsp-mode core section (Phase 2.2)
3. Edit `config.org`: add lsp-java section (Phase 2.3)
4. Edit `config.org`: remove eglot + eglot-java sections (Phase 2.1)
5. Edit `config.org`: update Cape (Phase 2.4)
6. Edit `config.org`: add smart code actions (Phase 3)
7. Edit `config.org`: replace dirvish with treemacs (Phase 4)
8. Edit `config.org`: update all keybindings (Phase 5)
9. Edit `config.org`: cleanup (Phase 6)
10. Run `./bin/validate-config`
11. Run smoke test
12. Report results — do NOT commit until user approves
