;;; evil-conf --- base evilconfig
;;; Commentary:

;;; Code:
(require 'evil)
(require 'evil-leader)
(evil-mode 1)
(evil-leader/set-leader "\\")
(global-evil-leader-mode 1)
(evil-leader-mode 1)

;; evil-Ibuffer
(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
(evil-set-initial-state 'ibuffer-mode 'normal)

(provide 'evil-conf)
;;; evil-conf.el ends here
