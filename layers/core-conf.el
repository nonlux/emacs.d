;;; core-conf --- core emacs configs
;;; Commentary:

;;; Code:
(require 'linum-relative)
(require 'color-theme)
(require 'color-theme-solarized)
(require 'flycheck)
;(require 'blank-mode)

;;core
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(global-flycheck-mode)

;;base gui
(tool-bar-mode -1)
(menu-bar-mode -1)
(linum-mode 1)
(linum-relative-global-mode 1)

;; solarized
(setq frame-background-mode 'dark)
(load-theme 'solarized t)

;;; blank mode
;(setq blank-space " ")
;(blank-mode 1)
;;(setq blank-chars '(tabs spaces))
;;(setq whitespace-style '(faces tabs trailing space-before-tab indentation empty space-after-tab tab-mark))
;;(global-whitespace-mode 1)

(provide 'core-conf)

;;; core-conf.el ends here
