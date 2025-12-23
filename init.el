;;; init.el --- Bootstrap for Literate Config -*- lexical-binding: t -*-

;; 1. Performance tuning for startup
(setq gc-cons-threshold (* 50 1000 1000))

;; 2. Initialize Package Manager (Standard package.el)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(setq use-package-always-ensure t)
;; 3. Ensure use-package is available (Native in Emacs 29+)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ;; Always download packages if missing

;; 4. Load the Literate Configuration
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; 5. Reset GC threshold after startup
(setq gc-cons-threshold (* 100 1024 1024))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0f1341c0096825b1e5d8f2ed90996025a0d013a0978677956a9e61408fcd2c77"
     default))
 '(package-selected-packages
   '(consult-dir consult-lsp consult-yasnippet gemini-cli ob-mermaid))
 '(package-vc-selected-packages
   '((gemini-cli :url "https://github.com/linchen2chris/gemini-cli.el"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

