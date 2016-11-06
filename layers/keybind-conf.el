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
  "ll" 'linum-mode
  "lr" 'linum-relative-toggle
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

;;projectile
(evil-leader/set-key
  "pp" 'projectile-mode
  "pd" 'projectile-dired
  "pf" 'projectile-find-file
)
;; tmux
(defun prompt-tmx()
  "switch to other tmx project"
  (interactive)
  (let ((x (read-string "Enter project name:")))
    (shell-command (format "tmuxinator  %s" x)))
)
(defun prompt-window()
  "switch to other tmx project"
  (interactive)
  (let ((x (read-string "Enter window:")))
    (shell-command (format "tmux select-window -t :=%s" x)))
)

(evil-leader/set-key
  "tp" 'prompt-tmx
  "tt" 'prompt-window
)


(defun gar() "" (interactive) (shell-command "yo prj:ansibleRole"))
(evil-leader/set-key
  "gar" 'gar
)

(defun load-init-config()
  "Reload init"
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(evil-leader/set-key "ti" 'load-init-config)
(provide 'keybind-conf)
;;; keybind-conf ends here
