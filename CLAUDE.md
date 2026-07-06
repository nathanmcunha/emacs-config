# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **literate Emacs configuration** using modular Org Mode files (`core.org`, `completion.org`, `tools.org`, etc.) that tangle to `.el` files. It replicates Doom Emacs ergonomics (Evil mode, SPC leader keys) using vanilla Emacs packages unified under Nix `emacsWithPackagesFromUsePackage`. The configuration is heavily optimized for Emacs 30+ with native compilation.

## Architecture
**Key Files (modular org config):**
- `core.org` / `core.el` — Startup, defaults, leader, custom functions
- `completion.org` / `completion.el` — Vertico, Corfu, Cape, Consult, Embark
- `ui.org` / `ui.el` — Visuals, modeline, fonts
- `theme.org` / `theme.el` — Theme loading
- `tools.org` / `tools.el` — LSP, magit, org-mode, languages
- `bindings.org` / `bindings.el` — Leader keybindings
- `config.org` / `config.el` — Loader (`dolist` over all `.el` modules) + custom-file
- `notes.org` — Org mode, Org-roam, Markdown, auto-tangle


## Common Commands

**Package Management:**
```bash
./bin/emacs-cli sync        # Install packages and sync config
./bin/emacs-cli update      # Update all packages
./bin/emacs-cli doctor      # Health check
./bin/emacs-cli purge       # Clean builds/caches (fixes compilation errors)
```

**Validation:**
```bash
./bin/test-validators       # Full validation suite (blocks, parens, tangle, startup, byte-compile)
./bin/validate-config <file.org> # Validate any org file (blocks, tangle, load, compile)
```

**For Elisp files:**
```bash
python3 bin/validate-lisp-syntax.py FILE.el
```

**Smoke Test:**
```bash
emacs -Q --batch --eval '(setq user-emacs-directory default-directory)' -l init.el --eval '(message "Startup OK")'
```

**Byte-Compile (Strict):**
```bash
emacs -Q --batch -L . --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile init.el early-init.el
```

## Edit-Loop Validation (MANDATORY after .org edits)

After any `.org` file edit that changes elisp in a `#+begin_src` block:

```bash
# 1. Validate the org file
./bin/validate-config <file.org>

# 2. Re-tangle to .el
emacs --batch -l org --eval '(require (quote ob-emacs-lisp)) (org-babel-tangle-file "<file.org>")'

# 3. Reload in running session (or restart emacs)
emacsclient --eval '(my/reload-config)'
```

**The validate step catches**: stale tangles, unbalanced parens (the #1 regression risk), loose code outside src blocks, and byte-compile errors. Failures here mean the change will break at runtime.

- **Org files** — validate with: `./bin/validate-config <file.org>`
- All Lisp code MUST be inside `#+begin_src emacs-lisp ... #+end_src` blocks (test 2 catches violations)
- `./bin/validate-config` now includes 5 tests: block balance, loose-code detection, stale-tangle detection, tangle+load+byte-compile, and syntax sanity

## Session Snapshot Workflow

At the start of each working session (first action after opening repo), create a rollback snapshot:

```bash
mkdir -p snapshots/$(date +%Y%m%d-%H%M%S)
cp -a *.org *.el bin/ README.md snapshots/$(date +%Y%m%d-%H%M%S)/
```

Rollback by restoring from `snapshots/<timestamp>/` via `cp -a`.

## Key Bindings (Doom-style)

- `SPC` — Leader key (Normal/Visual states)
- `M-SPC` — Global leader (Insert/Emacs states)
- `SPC .` — Find file
- `SPC ,` — Switch buffer
- `SPC ;` — Embark Act
- `SPC u` — vundo (visual undo tree)
- `SPC g s` — Magit status
- `SPC c a` — Eglot code actions
- `SPC c f` — apheleia-format-buffer

## Important Notes
- Theme: base16-rose-pine-moon from base16-theme on MELPA. Other available variants: base16-rose-pine, base16-rose-pine-dawn.
- Always validate changed `.org` files with `./bin/validate-config <file.org>` before testing.
- Custom functions are defined in `core.org` under the "Custom Functions" heading — verify their existence before using them in changes.
- Focus-out hooks use `after-focus-change-function` via `add-function` (not `focus-out-hook`).
