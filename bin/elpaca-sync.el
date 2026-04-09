;;; elpaca-sync.el --- Elpaca sync script for emacs-cli -*- lexical-binding: t; -*-
(require 'cl-lib)

(defvar elpaca--prev-progress nil)
(defvar elpaca-sync-phase (or (getenv "ELPACA_SYNC_PHASE") "full"))

(message "[Elpaca] Starting package sync (%s phase)..." elpaca-sync-phase)

;; Ensure queues start processing if they haven't already
(unless (bound-and-true-p elpaca--queues)
  (elpaca-process-queues))

;; Wait for any initial recipe fetches or installations to start
(message "[Elpaca] Waiting for queue activation...")
(let ((wait-count 0))
  (while (and (< wait-count 10) ; wait max 10s for something to appear in queue
              (not (cl-loop for q in elpaca--queues thereis (elpaca-q<-elpacas q))))
    (elpaca-process-queues)
    (sit-for 1)
    (setq wait-count (1+ wait-count))))

(cl-labels ((phase-done-p (e)
              (let ((statuses (elpaca<-statuses (cdr e))))
                (pcase elpaca-sync-phase
                  ("clone" (or (memq 'ref-checked-out statuses)
                               (memq 'finished statuses)
                               (memq 'failed statuses)))
                  ("build" (or (memq 'autoloads statuses)
                               (memq 'byte-compilation statuses)
                               (memq 'finished statuses)
                               (memq 'failed statuses)))
                  ("compile" (or (memq 'byte-compilation statuses)
                                 (memq 'finished statuses)
                                 (memq 'failed statuses)))
                  (_ (or (memq 'finished statuses)
                         (memq 'failed statuses)))))))
  (while (cl-loop for q in elpaca--queues thereis
                  (and (not (eq (elpaca-q<-status q) 'complete))
                       (elpaca-q<-elpacas q)))
    (elpaca-process-queues)
    (let* ((all-elpacas (cl-loop for q in elpaca--queues append (elpaca-q<-elpacas q)))
           (total (length all-elpacas))
           (processed (cl-count-if #'phase-done-p all-elpacas))
           (remaining (- total processed))
           (current (cl-loop for e in all-elpacas
                             unless (phase-done-p e)
                             collect (car e)))
           (progress-key (list processed total remaining)))
      (when (and (> total 0) (not (equal progress-key elpaca--prev-progress)))
        (setq elpaca--prev-progress progress-key)
        (message "[Elpaca] %s phase: %d/%d processed (%d remaining)"
                 elpaca-sync-phase processed total remaining)
        (when (and (boundp 'elpaca-verbose) elpaca-verbose current)
          (message "[Elpaca] Current: %s" (truncate-string-to-width (format "%s" current) 80 nil nil "...")))))
    (sit-for 1)))

(message "✨ Sync complete (%s phase)." elpaca-sync-phase)
