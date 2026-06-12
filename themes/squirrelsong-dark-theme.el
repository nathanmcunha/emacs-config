;;; squirrelsong-dark-theme.el --- Squirrelsong Dark for Emacs -*- lexical-binding: t -*-
;; https://sapegin.me/squirrelsong/

(deftheme squirrelsong-dark
  "Squirrelsong Dark — low contrast theme for web developers.")

(let* ((bg           "#292019")  ; gray180
      (bg-alt       "#352a21")  ; gray170
      (bg-alt2      "#453327")  ; gray160
      (fg           "#bfac99")  ; gray060
      (fg-dim       "#846d5c")  ; gray100
      (fg-faint     "#695444")  ; gray120
      (border       "#5b4839")  ; gray140

      ;; Syntax
      (keyword      "#7f61b3")  ; magenta
      (string       "#558240")  ; green
      (fn           "#5993c2")  ; blue
      (var          "#5993c2")  ; blue
      (type         "#4f9593")  ; teal
      (const        "#b18433")  ; orange
      (builtin      "#5993c2")  ; blue
      (comment      "#695444")  ; gray120

      ;; Accents
      (green        "#558240")
      (green+       "#709855")
      (teal         "#4f9593")
      (teal+        "#72aaa8")
      (blue         "#5993c2")
      (blue+        "#63a2d6")
      (magenta      "#7f61b3")
      (magenta+     "#9672d4")
      (red          "#ac493e")
      (red+         "#ce574a")
      (orange       "#b18433")
      (yellow       "#ceb250")
      (yellow+      "#e2c358")

      ;; UI
      (selection    "#6a5444")  ; brightYellow
      (match        "#ca5a83")  ; brightPink
      (cursor       "#5993c2")
      (line-nr      "#695444") ; gray120
      (line-nr-cur  "#bfac99")

      ;; Semantic
      (success      "#709855")
      (warning      "#d8a851")
      (error        "#ce574a")
      (info         blue+))

  (custom-theme-set-faces
   'squirrelsong-dark

   ;; Base
   `(default ((t (:background ,bg :foreground ,fg))))
   `(fringe ((t (:background ,bg))))
   `(region ((t (:background ,selection :foreground ,fg))))
   `(highlight ((t (:background ,bg-alt))))
   `(cursor ((t (:background ,cursor))))
   `(shadow ((t (:foreground ,fg-dim))))
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,magenta :underline t))))
   `(minibuffer-prompt ((t (:foreground ,keyword :weight bold))))
   `(escape-glyph ((t (:foreground ,orange))))
   `(homoglyph ((t (:foreground ,orange))))
   `(success ((t (:foreground ,success))))
   `(warning ((t (:foreground ,warning))))
   `(error ((t (:foreground ,error :weight bold))))

   ;; Line numbers
   `(line-number ((t (:background ,bg :foreground ,line-nr))))
   `(line-number-current-line ((t (:background ,bg :foreground ,line-nr-cur :weight bold))))

   ;; Mode line
   `(mode-line ((t (:background ,bg-alt2 :foreground ,fg))))
   `(mode-line-inactive ((t (:background ,bg-alt :foreground ,fg-dim))))
   `(mode-line-highlight ((t (:background ,bg-alt2 :foreground ,keyword))))
   `(mode-line-buffer-id ((t (:weight bold))))

   ;; Header line / tab bar
   `(header-line ((t (:background ,bg-alt :foreground ,fg))))
   `(tab-bar ((t (:background ,bg-alt :foreground ,fg))))
   `(tab-bar-tab ((t (:background ,bg :foreground ,fg :weight bold))))
   `(tab-bar-tab-inactive ((t (:background ,bg-alt :foreground ,fg-dim))))

   ;; Window dividers
   `(window-divider ((t (:foreground ,bg-alt))))
   `(vertical-border ((t (:foreground ,bg-alt))))

   ;; Search
   `(isearch ((t (:background ,match :foreground ,bg)))) ; bg on pink = 4.0:1 (fg was 1.81:1)
   `(lazy-highlight ((t (:background "#5e375c" :foreground ,fg)))) ; brightPinkDimer
   `(match ((t (:background "#a65472" :foreground ,fg)))) ; brightPinkDim

   ;; Font lock (syntax highlighting) — from Squirrelsong code.json
   `(font-lock-keyword-face ((t (:foreground ,keyword :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,fn :weight bold))))
   `(font-lock-variable-name-face ((t (:foreground ,var :slant italic))))
   `(font-lock-type-face ((t (:foreground ,type :weight bold))))
   `(font-lock-constant-face ((t (:foreground ,const))))
   `(font-lock-string-face ((t (:foreground ,string))))
   `(font-lock-builtin-face ((t (:foreground ,builtin))))
   `(font-lock-comment-face ((t (:foreground ,comment :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,comment :slant italic))))
   `(font-lock-preprocessor-face ((t (:foreground ,teal :weight bold))))
   `(font-lock-warning-face ((t (:foreground ,warning))))
   `(font-lock-negation-char-face ((t (:foreground ,teal))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,orange :weight bold))))
   `(font-lock-number-face ((t (:foreground ,orange))))
   `(font-lock-operator-face ((t (:foreground ,teal))))
   `(font-lock-punctuation-face ((t (:foreground ,fg))))
   `(font-lock-property-name-face ((t (:foreground ,blue))))
   `(font-lock-property-use-face ((t (:foreground ,blue))))
   `(font-lock-misc-punctuation-face ((t (:foreground ,fg))))
   `(font-lock-delimiter-face ((t (:foreground ,fg))))

   ;; Solaire (if used)
   `(solaire-default-face ((t (:background ,bg-alt :foreground ,fg))))
   `(solaire-fringe-face ((t (:background ,bg-alt))))
   `(solaire-mode-line-face ((t (:background ,bg-alt2 :foreground ,fg))))
   `(solaire-mode-line-inactive-face ((t (:background ,bg-alt :foreground ,fg-dim))))
   `(solaire-hl-line-face ((t (:background ,bg-alt2))))

   ;; Paren matching
   `(show-paren-match ((t (:background ,bg-alt2 :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,fg))))

   ;; Selection / completion
   `(completions-common-part ((t (:foreground ,keyword :weight bold))))
   `(completions-first-difference ((t (:foreground ,string))))

   ;; Vertico
   `(vertico-current ((t (:background ,bg-alt2 :weight bold))))
   `(vertico-group-separator ((t (:foreground ,fg-faint))))
   `(vertico-group-title ((t (:foreground ,fg-faint :slant italic))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,keyword :weight bold))))
   `(orderless-match-face-1 ((t (:foreground ,string :weight bold))))
   `(orderless-match-face-2 ((t (:foreground ,type :weight bold))))
   `(orderless-match-face-3 ((t (:foreground ,error :weight bold))))

   ;; Corfu
   `(corfu-default ((t (:background ,bg-alt :foreground ,fg))))
   `(corfu-current ((t (:background ,bg-alt2 :foreground ,fg))))
   `(corfu-border ((t (:background ,border))))

   ;; Diff
   `(diff-added ((t (:background "#2d2b39" :foreground ,green+)))) ; greenDimmest
   `(diff-removed ((t (:background "#332239" :foreground ,red+)))) ; redDimmest
   `(diff-changed ((t (:foreground ,yellow))))
   `(diff-header ((t (:foreground ,fg-dim))))
   `(diff-file-header ((t (:foreground ,fg :weight bold))))
   `(diff-hunk-header ((t (:foreground ,teal))))
   `(diff-refine-added ((t (:background "#3e5550" :foreground ,green+))))
   `(diff-refine-removed ((t (:background "#44283a" :foreground ,red+))))

   ;; Magit (common faces)
   `(magit-section-highlight ((t (:background ,bg-alt))))
   `(magit-diff-hunk-heading ((t (:background ,bg-alt :foreground ,teal))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,bg-alt2 :foreground ,teal+))))
   `(magit-diff-added ((t (:background "#2d2b39" :foreground ,green))))
   `(magit-diff-removed ((t (:background "#332239" :foreground ,red))))

   ;; Org-mode
   `(org-level-1 ((t (:foreground ,keyword :weight bold :height 1.3))))
   `(org-level-2 ((t (:foreground ,string :weight bold :height 1.2))))
   `(org-level-3 ((t (:foreground ,type :weight bold :height 1.1))))
   `(org-level-4 ((t (:foreground ,keyword :weight bold))))
   `(org-level-5 ((t (:foreground ,string :weight bold))))
   `(org-level-6 ((t (:foreground ,type :weight bold))))
   `(org-document-title ((t (:foreground ,keyword :weight bold :height 1.5))))
   `(org-todo ((t (:foreground ,error :weight bold))))
   `(org-done ((t (:foreground ,success :weight bold))))
   `(org-block ((t (:background ,bg-alt))))
   `(org-block-begin-line ((t (:background ,bg-alt2 :foreground ,fg-faint))))
   `(org-block-end-line ((t (:background ,bg-alt2 :foreground ,fg-faint))))
   `(org-table ((t (:foreground ,fg))))
   `(org-code ((t (:background ,bg-alt :foreground ,type))))
   `(org-verbatim ((t (:background ,bg-alt :foreground ,string))))
   `(org-quote ((t (:background ,bg-alt :foreground ,fg-dim :slant italic))))
   `(org-checkbox ((t (:foreground ,teal :weight bold))))

   ;; Doom modeline
   `(doom-modeline-bar ((t (:background ,keyword))))
   `(doom-modeline-buffer-file ((t (:foreground ,fg :weight bold))))
   `(doom-modeline-buffer-modified ((t (:foreground ,orange))))
   `(doom-modeline-info ((t (:foreground ,teal))))
   `(doom-modeline-warning ((t (:foreground ,warning))))
   `(doom-modeline-error ((t (:foreground ,error))))
   `(doom-modeline-project-dir ((t (:foreground ,blue))))
   `(doom-modeline-lsp-success ((t (:foreground ,success))))

   ;; Flymake
   `(flymake-error ((t (:underline (:style wave :color ,error)))))
   `(flymake-warning ((t (:underline (:style wave :color ,warning)))))
   `(flymake-note ((t (:underline (:style wave :color ,info)))))

   ;; Compilation
   `(compilation-error ((t (:foreground ,error))))
   `(compilation-warning ((t (:foreground ,warning))))
   `(compilation-info ((t (:foreground ,info))))
   `(compilation-line-number ((t (:foreground ,fg-dim))))

   ;; Which-key
   `(which-key-key-face ((t (:foreground ,keyword))))
   `(which-key-command-description-face ((t (:foreground ,fg))))
   `(which-key-separator-face ((t (:foreground ,fg-faint))))

   ;; Rainbow identifiers (override with theme colors)
   `(rainbow-identifiers-identifier-1 ((t (:foreground ,fn))))
   `(rainbow-identifiers-identifier-2 ((t (:foreground ,type))))
   `(rainbow-identifiers-identifier-3 ((t (:foreground ,keyword))))
   `(rainbow-identifiers-identifier-4 ((t (:foreground ,string))))
   `(rainbow-identifiers-identifier-5 ((t (:foreground ,const))))

   ;; Dired
   `(dired-directory ((t (:foreground ,blue :weight bold))))
   `(dired-symlink ((t (:foreground ,teal))))

   ;; Ediff
   `(ediff-current-diff-A ((t (:background "#332239" :foreground ,red+))))
   `(ediff-current-diff-B ((t (:background "#2d2b39" :foreground ,green+))))
   `(ediff-current-diff-C ((t (:background "#41352a" :foreground ,yellow+))))

   ;; Terminal / ghostel — Squirrelsong Dark terminal palette
   `(ghostel-color-black ((t (:foreground "#5b4839" :background "#5b4839"))))
   `(ghostel-color-red ((t (:foreground ,red+ :background ,red))))
   `(ghostel-color-green ((t (:foreground ,green+ :background ,green))))
   `(ghostel-color-yellow ((t (:foreground ,yellow+ :background ,yellow))))
   `(ghostel-color-blue ((t (:foreground ,blue+ :background ,blue))))
   `(ghostel-color-magenta ((t (:foreground ,magenta+ :background ,magenta))))
   `(ghostel-color-cyan ((t (:foreground ,teal+ :background ,teal))))
   `(ghostel-color-white ((t (:foreground ,fg :background "#988571"))))
   `(ghostel-color-bright-black ((t (:foreground "#5b4839" :background "#5b4839"))))
   `(ghostel-color-bright-red ((t (:foreground ,red+ :background ,red))))
   `(ghostel-color-bright-green ((t (:foreground ,green+ :background ,green))))
   `(ghostel-color-bright-yellow ((t (:foreground ,yellow+ :background ,yellow))))
   `(ghostel-color-bright-blue ((t (:foreground ,blue+ :background ,blue))))
   `(ghostel-color-bright-magenta ((t (:foreground ,magenta+ :background ,magenta))))
   `(ghostel-color-bright-cyan ((t (:foreground ,teal+ :background ,teal))))
   `(ghostel-color-bright-white ((t (:foreground ,fg :background "#988571"))))

   ;; Company (if used)
   `(company-tooltip ((t (:background ,bg-alt :foreground ,fg))))
   `(company-tooltip-selection ((t (:background ,bg-alt2))))
   `(company-tooltip-common ((t (:foreground ,keyword :weight bold))))
   `(company-scrollbar-bg ((t (:background ,bg-alt))))
   `(company-scrollbar-fg ((t (:background ,border))))

   ;; Tree-sitter highlights (for treesit)
   `(tree-sitter-hl-face:keyword ((t (:foreground ,keyword :weight bold))))
   `(tree-sitter-hl-face:function ((t (:foreground ,fn :weight bold))))
   `(tree-sitter-hl-face:function.call ((t (:foreground ,fn))))
   `(tree-sitter-hl-face:variable ((t (:foreground ,var))))
   `(tree-sitter-hl-face:variable.parameter ((t (:foreground ,var :slant italic))))
   `(tree-sitter-hl-face:type ((t (:foreground ,type :weight bold))))
   `(tree-sitter-hl-face:type.argument ((t (:foreground ,type))))
   `(tree-sitter-hl-face:constant ((t (:foreground ,const))))
   `(tree-sitter-hl-face:string ((t (:foreground ,string))))
   `(tree-sitter-hl-face:comment ((t (:foreground ,comment :slant italic))))
   `(tree-sitter-hl-face:operator ((t (:foreground ,teal))))
   `(tree-sitter-hl-face:punctuation ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:property ((t (:foreground ,blue))))
   `(tree-sitter-hl-face:constructor ((t (:foreground ,type :weight bold))))
   `(tree-sitter-hl-face:tag ((t (:foreground ,keyword :weight bold))))
   `(tree-sitter-hl-face:attribute ((t (:foreground ,teal :weight bold))))

   ;; Eglot / LSP
   `(eglot-diagnostic-tag-unnecessary ((t (:foreground ,fg-faint))))
   `(eglot-diagnostic-tag-deprecated ((t (:strike-through t :foreground ,fg-faint))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,keyword))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,string))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,type))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,const))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,magenta))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,teal))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,orange))))

   ;; Dashboard / nerd-icons
   `(nerd-icons-blue ((t (:foreground ,blue))))
   `(nerd-icons-green ((t (:foreground ,green))))
   `(nerd-icons-yellow ((t (:foreground ,yellow))))
   `(nerd-icons-red ((t (:foreground ,red))))
   `(nerd-icons-purple ((t (:foreground ,magenta))))
   `(nerd-icons-cyan ((t (:foreground ,teal))))
   `(nerd-icons-orange ((t (:foreground ,orange))))

   ;; ANSI colors (for term/compile buffers)
   `(ansi-color-black ((t (:foreground "#5b4839"))))
   `(ansi-color-red ((t (:foreground ,red+))))
   `(ansi-color-green ((t (:foreground ,green+))))
   `(ansi-color-yellow ((t (:foreground ,yellow+))))
   `(ansi-color-blue ((t (:foreground ,blue+))))
   `(ansi-color-magenta ((t (:foreground ,magenta+))))
   `(ansi-color-cyan ((t (:foreground ,teal+))))
   `(ansi-color-white ((t (:foreground ,fg))))))

(provide-theme 'squirrelsong-dark)
;;; squirrelsong-dark-theme.el ends here
