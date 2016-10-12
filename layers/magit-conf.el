;;; magit-conf -- magit config
;;; Commentary:

;;; Code:
(require 'magit)
(require 'git-gutter)
(require 'evil-magit)
(global-git-gutter-mode)
(evil-set-initial-state 'magit-mode 'normal)
(evil-set-initial-state 'magit-popup-mode 'insert)
(provide 'magit-conf)
;;; magit-conf.el ends here
