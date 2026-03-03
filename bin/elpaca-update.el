;;; elpaca-update.el --- Elpaca update script for emacs-cli -*- lexical-binding: t; -*-
(require 'cl-lib)

(defvar elpaca--prev-progress nil)

(message "[Elpaca] Updating all packages...")
(elpaca-update-all)
(while (cl-loop for q in elpaca--queues thereis
                (and (not (eq (elpaca-q<-status q) 'complete))
                     (elpaca-q<-elpacas q)))
  (elpaca-process-queues)
  (let* ((all-elpacas (cl-loop for q in elpaca--queues append (elpaca-q<-elpacas q)))
         (total (length all-elpacas))
         (processed (cl-count-if (lambda (e) (memq 'finished (elpaca<-statuses (cdr e)))) all-elpacas))
         (remaining (- total processed))
         (current (cl-loop for e in all-elpacas
                           unless (memq 'finished (elpaca<-statuses (cdr e)))
                           collect (car e)))
         (progress-key (list processed total remaining)))
    (when (and (> total 0) (not (equal progress-key elpaca--prev-progress)))
      (setq elpaca--prev-progress progress-key)
      (message "[Elpaca] Progress: %d/%d processed (%d remaining)" processed total remaining)
      (when (and (boundp 'elpaca-verbose) elpaca-verbose current)
        (message "[Elpaca] Current: %s" (truncate-string-to-width (format "%s" current) 80 nil nil "...")))))
  (sit-for 1))
(message "✨ Update complete.")
