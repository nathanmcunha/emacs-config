;;; squirrelsong-light-theme.el --- Squirrelsong Light for Emacs -*- lexical-binding: t -*-
;; https://sapegin.me/squirrelsong/

(deftheme squirrelsong-light
  "Squirrelsong Light — low contrast theme for web developers.")

(let* ((bg           "#fdfdfe")  ; gray180
      (bg-alt       "#f7f6f9")  ; gray170
      (bg-alt2      "#e8e5eb")  ; gray160
      (fg           "#4c4b4e")  ; gray060
      (fg-alt       "#6b676f")  ; gray080
      (fg-dim       "#8c8792")  ; gray100
      (fg-faint     "#a8a1af")  ; gray120
      (border       "#c9c4cf")  ; gray140

      ;; Syntax — use contrast palette (base too light for white bg)
      (keyword      "#806f9b")  ; magentaContrast
      (string       "#657d38")  ; greenContrast
      (fn           "#4b7b97")  ; blueContrast
      (var          "#4b7b97")  ; blueContrast
      (type         "#3e816e")  ; tealContrast
      (const        "#c88539")  ; orangeContrast
      (builtin      "#4b7b97")  ; blueContrast
      (comment      "#9c96a2")  ; gray110

      ;; Accents — base palette for decorative, contrast for legible
      (green        "#9bae7e")
      (green+       "#657d38")  ; greenContrast
      (teal         "#5f9b8d")
      (teal+        "#3e816e")  ; tealContrast
      (blue         "#80a4be")
      (blue+        "#4b7b97")  ; blueContrast
      (magenta      "#ac9bc5")
      (magenta+     "#806f9b")  ; magentaContrast
      (red          "#d67e76")
      (red+         "#c06159")  ; redContrast
      (orange       "#de9e59")
      (orange+      "#c88539")  ; orangeContrast
      (yellow       "#e4c158")
      (yellow+      "#bf8a18")  ; yellowContrast

      ;; UI
      (selection    "#f5da70")  ; brightYellow
      (match        "#e87da4")  ; brightPink
      (cursor       "#4b7b97")  ; blueContrast
      (line-nr      "#a8a1af") ; gray120
      (line-nr-cur  "#4c4b4e") ; gray060

      ;; Semantic
      (success      "#657d38")  ; greenContrast
      (warning      "#c88539")  ; orangeContrast
      (error        "#c06159")  ; redContrast
      (info         blue+))

  (custom-theme-set-faces
   'squirrelsong-light

   ;; Base
   `(default ((t (:background ,bg :foreground ,fg))))
   `(fringe ((t (:background ,bg))))
   `(region ((t (:background ,selection :foreground ,fg)))) ; brightYellow
   `(highlight ((t (:background ,bg-alt))))
   `(cursor ((t (:background ,cursor))))
   `(shadow ((t (:foreground ,fg-dim))))
   `(link ((t (:foreground ,blue+ :underline t))))
   `(link-visited ((t (:foreground ,magenta+ :underline t))))
   `(minibuffer-prompt ((t (:foreground ,keyword :weight bold))))
   `(escape-glyph ((t (:foreground ,orange+))))
   `(homoglyph ((t (:foreground ,orange+))))
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
   `(window-divider ((t (:foreground ,bg-alt2))))
   `(vertical-border ((t (:foreground ,bg-alt2))))

   ;; Search
   `(isearch ((t (:background ,match :foreground ,fg))))
   `(lazy-highlight ((t (:background "#fae1ea" :foreground ,fg)))) ; brightPinkDimer
   `(match ((t (:background "#f0a8c2" :foreground ,fg)))) ; brightPinkDim

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
   `(font-lock-preprocessor-face ((t (:foreground ,teal+ :weight bold))))
   `(font-lock-warning-face ((t (:foreground ,warning))))
   `(font-lock-negation-char-face ((t (:foreground ,teal+))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,yellow+ :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,orange+ :weight bold))))
   `(font-lock-number-face ((t (:foreground ,const))))
   `(font-lock-operator-face ((t (:foreground ,type))))
   `(font-lock-punctuation-face ((t (:foreground ,fg-alt)))) ; gray090-ish
   `(font-lock-property-name-face ((t (:foreground ,fn))))
   `(font-lock-property-use-face ((t (:foreground ,fn))))
   `(font-lock-misc-punctuation-face ((t (:foreground ,fg-alt))))
   `(font-lock-delimiter-face ((t (:foreground ,fg-alt))))

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
   `(diff-added ((t (:background "#f2f4f1" :foreground ,green+)))) ; greenDimmest
   `(diff-removed ((t (:background "#faf4f4" :foreground ,red+)))) ; redDimmest
   `(diff-changed ((t (:foreground ,yellow))))
   `(diff-header ((t (:foreground ,fg-dim))))
   `(diff-file-header ((t (:foreground ,fg :weight bold))))
   `(diff-hunk-header ((t (:foreground ,teal+))))
   `(diff-refine-added ((t (:background "#dde2d7" :foreground ,green+)))) ; greenDimer
   `(diff-refine-removed ((t (:background "#f5e5e4" :foreground ,red+)))) ; redDimer (upstream deletedWordBackground)

   ;; Magit (common faces)
   `(magit-section-highlight ((t (:background ,bg-alt))))
   `(magit-diff-hunk-heading ((t (:background ,bg-alt :foreground ,teal+))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,bg-alt2 :foreground ,teal+))))
   `(magit-diff-added ((t (:background "#f2f4f1" :foreground ,green+))))
   `(magit-diff-removed ((t (:background "#faf4f4" :foreground ,red+))))

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
   `(org-checkbox ((t (:foreground ,teal+ :weight bold))))

   ;; Doom modeline
   `(doom-modeline-bar ((t (:background ,keyword))))
   `(doom-modeline-buffer-file ((t (:foreground ,fg :weight bold))))
   `(doom-modeline-buffer-modified ((t (:foreground ,orange+))))
   `(doom-modeline-info ((t (:foreground ,teal+))))
   `(doom-modeline-warning ((t (:foreground ,warning))))
   `(doom-modeline-error ((t (:foreground ,error))))
   `(doom-modeline-project-dir ((t (:foreground ,blue+))))
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
   `(dired-directory ((t (:foreground ,blue+ :weight bold))))
   `(dired-symlink ((t (:foreground ,teal+))))

   ;; Ediff
   `(ediff-current-diff-A ((t (:background "#faf4f4" :foreground ,red+))))
   `(ediff-current-diff-B ((t (:background "#f2f4f1" :foreground ,green+))))
   `(ediff-current-diff-C ((t (:background "#f7f0da" :foreground ,yellow+))))

   ;; Terminal / ghostel — Squirrelsong Light terminal palette
   `(ghostel-color-black ((t (:foreground "#4c4b4e" :background "#b8b1be")))) ; gray060/gray130 (upstr)
   `(ghostel-color-red ((t (:foreground ,red+ :background ,red))))
   `(ghostel-color-green ((t (:foreground ,green+ :background ,green))))
   `(ghostel-color-yellow ((t (:foreground ,orange+ :background ,orange))))
   `(ghostel-color-blue ((t (:foreground ,blue+ :background ,blue))))
   `(ghostel-color-magenta ((t (:foreground ,magenta+ :background ,magenta))))
   `(ghostel-color-cyan ((t (:foreground ,teal+ :background ,teal))))
   `(ghostel-color-white ((t (:foreground "#8c8792" :background "#c9c4cf")))) ; gray100/gray140 (upstr)
   `(ghostel-color-bright-black ((t (:foreground "#4c4b4e" :background "#b8b1be"))))
   `(ghostel-color-bright-red ((t (:foreground ,red :background ,red+))))
   `(ghostel-color-bright-green ((t (:foreground ,green :background ,green+))))
   `(ghostel-color-bright-yellow ((t (:foreground ,orange :background ,orange+))))
   `(ghostel-color-bright-blue ((t (:foreground ,blue :background ,blue+))))
   `(ghostel-color-bright-magenta ((t (:foreground ,magenta :background ,magenta+))))
   `(ghostel-color-bright-cyan ((t (:foreground ,teal :background ,teal+))))
   `(ghostel-color-bright-white ((t (:foreground "#8c8792" :background "#c9c4cf"))))

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
   `(tree-sitter-hl-face:operator ((t (:foreground ,type))))
   `(tree-sitter-hl-face:punctuation ((t (:foreground ,fg-alt))))
   `(tree-sitter-hl-face:property ((t (:foreground ,fn))))
   `(tree-sitter-hl-face:constructor ((t (:foreground ,type :weight bold))))
   `(tree-sitter-hl-face:tag ((t (:foreground ,keyword :weight bold))))
   `(tree-sitter-hl-face:attribute ((t (:foreground ,teal+ :weight bold))))

   ;; Eglot / LSP
   `(eglot-diagnostic-tag-unnecessary ((t (:foreground ,fg-faint))))
   `(eglot-diagnostic-tag-deprecated ((t (:strike-through t :foreground ,fg-faint))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,keyword))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,string))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,type))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,const))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,magenta+))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,teal+))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,orange+))))

   ;; Dashboard / nerd-icons
   `(nerd-icons-blue ((t (:foreground ,blue+))))
   `(nerd-icons-green ((t (:foreground ,green+))))
   `(nerd-icons-yellow ((t (:foreground ,orange+))))
   `(nerd-icons-red ((t (:foreground ,red+))))
   `(nerd-icons-purple ((t (:foreground ,magenta+))))
   `(nerd-icons-cyan ((t (:foreground ,teal+))))
   `(nerd-icons-orange ((t (:foreground ,orange+))))

   ;; ANSI colors (for term/compile buffers)
   `(ansi-color-black ((t (:foreground "#4c4b4e")))) ; gray060 (upstream terminalBlack)
   `(ansi-color-red ((t (:foreground ,red+))))
   `(ansi-color-green ((t (:foreground ,green+))))
   `(ansi-color-yellow ((t (:foreground ,orange+))))
   `(ansi-color-blue ((t (:foreground ,blue+))))
   `(ansi-color-magenta ((t (:foreground ,magenta+))))
   `(ansi-color-cyan ((t (:foreground ,teal+))))
   `(ansi-color-white ((t (:foreground ,fg))))))

(provide-theme 'squirrelsong-light)
;;; squirrelsong-light-theme.el ends here
