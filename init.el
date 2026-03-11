;;; init.el --- Bootstrap for Literate Config -*- lexical-binding: t; byte-compile-warnings: (not free-vars unresolved); -*-

;; 1. Performance tuning for startup
(setq gc-cons-threshold (* 50 1000 1000))
(setq read-process-output-max (* 1024 1024))
(setq jit-lock-defer-time 0.05)

;; 2. Directory Structure Setup (Doom Style)
(defconst my-local-dir (expand-file-name ".local/" user-emacs-directory))
(defconst my-local-pkg-dir (expand-file-name "packages/" my-local-dir))

;; 3. Elpaca Bootstrap (Official Installer v0.12 Adapted)
(defvar elpaca-installer-version 0.12)
;; ADAPTATION: Using custom directory here
(defvar elpaca-directory (expand-file-name "elpaca/" my-local-pkg-dir))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-sources-directory (expand-file-name "sources/" elpaca-directory))

(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca-activate)))

(let* ((repo  (expand-file-name "elpaca/" elpaca-sources-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))

(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; 4. Use-package Integration
;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq use-package-always-ensure t))

;; 5.Install Org-mode BEFORE loading configuration
;; This prevents "Org version mismatch" by ensuring org-babel
;; uses Elpaca version, not built-in Emacs version.
(elpaca org
  (require 'org))

;; --- CORE PACKAGES (init.el) ---

;; 1. Diminish
(use-package diminish :ensure t :demand t)

;; 2. Transient (Magit dependency)
(use-package transient :ensure t :demand t)

;; 4. Evil Mode (Your migrated configuration)
(use-package evil
  :ensure t
  :demand t
  :init
  ;; Essential pre-loading settings
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ;; Required for evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  (setq evil-select-enable-clipboard t))


;; --- FIM CORE ---

;; 5. Wait for Elpaca to be ready (Critical for config.org)
(elpaca-wait)

;; 6. Load Literate Configuration
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

(elpaca-wait)

;; 7. Post-startup GC
(setq gc-cons-threshold (* 16 1024 1024))
(add-function :after after-focus-change-function
              (lambda ()
                (unless (frame-focus-state)
                  (garbage-collect))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval setq-local lsp-java-java-path
           (string-trim (shell-command-to-string "mise which java"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
