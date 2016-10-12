;;; keybind-conf --- awesome key binds
;;; Commentary:

;;; Code:
;;leader buffer
(evil-leader/set-key
  ;;"bb" 'projectile-ibuffer
  "bm" 'buffer-menu
  "bn" 'next-buffer
  "bp" 'previous-buffer
  "bk" 'kill-buffer
)
;;window
(evil-leader/set-key
  ;;"bb" 'projectile-ibuffer
  "wh" 'split-window-vertically
  "wv" 'split-window-horizontally
)
;;linimun
(evil-leader/set-key
  "tll" 'linum-mode
  "tlr" 'linum-relative-toggle
)

;;magit
(evil-leader/set-key
  "gst" 'magit-status
)

;; code
(defun toogle-comment ()
  "Toggle region or the current comments.
Source: http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line"
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
           (comment-or-uncomment-region beg end)))

(evil-leader/set-key
  "dt" 'delete-trailing-whitespace
  "cc" 'toogle-comment
)


;;elisp
(evil-leader/set-key-for-mode 'emacs-lisp-mode "mm" 'eval-buffer)

(defun load-init-config()
  "Reload init"
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(evil-leader/set-key 'emacs-lisp-mode "ti" 'load-init-config)
(provide 'keybind-conf)
;;; keybind-conf ends here
