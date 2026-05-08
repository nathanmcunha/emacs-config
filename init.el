;;; init.el --- Bootstrap for Literate Config -*- lexical-binding: t; -*-

(require 'cl-lib)

;; Load the imported init file, but suppress package-manager installs so
;; Nix-provided packages never trigger Elpaca/package-vc prompts.
(cl-letf (((symbol-function 'package-install)
           (lambda (&rest _args) nil))
          ((symbol-function 'package-vc-install)
           (lambda (&rest _args) nil))
          ((symbol-function 'package-vc-install-from-checkout)
           (lambda (&rest _args) nil))
          ((symbol-function 'package-vc-install-selected-packages)
           (lambda (&rest _args) nil)))
  (load-file "/nix/store/g9wxrllawd39kk398vriaz9cxmd0x88a-source/init.el"))
