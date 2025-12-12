;; ~/.config/emacs/early-init.el

;; Otimização essencial para lsp-mode + emacs 30
;; Define a variável de ambiente para que a compilação do lsp-mode
;; detecte automaticamente que deve usar plists.
(setenv "LSP_USE_PLISTS" "true")

;; Opcional: Desabilita algumas coisas visuais logo no início para startup mais rápido
(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)
