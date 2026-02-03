;; ~/.config/emacs/early-init.el

;; Disable package loading at startup for faster boot
(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)

;; --- Native Compilation Optimizations ---
(setq comp-deferred-compilation t)
(setq comp-async-jobs-number 4)
(setq native-comp-speed 3)
