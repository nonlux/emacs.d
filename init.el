;;; init.el --- nonlux emacs config
;;; Commentary:
;;; require: git, mercurial, bazaar
;;; Code:
;; config paths
(add-to-list 'load-path "~/.emacs.d/layers/")

;; config repos
(require 'cl)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; quelpa
(defun nlx-quelpa-install()
  (package-refresh-contents)
  (if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer))))
;(nlx-quelpa-install)

(require 'quelpa)
(defvar config:packages)
(setq  config:packages '(
    evil
    evil-leader
    color-theme
    color-theme-solarized
    linum-relative
    magit
    evil-magit
    git-gutter
    blank-mode
    flycheck
    auto-complete
    ;filetypes packages:
    json-mode
    js2-mode
    dockerfile-mode
    yaml-mode
    markdown-mode
    ;; grizzl
    ;; projectile
    ;; perspective
    ;; persp-projectile
    yasnippet
    auto-yasnippet
    ;; ;; file type
    ;; json-reformat
    ;; json-snatcher
    ;; js2-refactor
))

(defun autoinstall-packages ()
  "Install packages from config:package variable."
  (dolist (p config:packages)
     (quelpa  p)))

(defun autorequire ()
  "Install packages from config:package variable."
  (dolist (p config:packages)
     (require p)))
(autoinstall-packages)
;(autorequire)

(require 'core-conf)
(require 'evil-conf)
(require 'magit-conf)
(require 'keybind-conf)

;for refactoring
;ac
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)
;yasnipets
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;utils
(defun show-major-mode ()
  "Show major modes."
  (interactive)
  (message "%s" major-mode))

;; modes
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(js2-bounce-indent-p t)
 '(package-selected-packages
   (quote
    (auto-yasnippet yasnippet markdown-mode yaml-mode dockerfile-mode js2-mode json-mode json-snatcher json-reformat auto-complete popup flycheck pkg-info epl blank-mode git-gutter evil-magit magit magit-popup git-commit with-editor dash async linum-relative color-theme-solarized evil-leader quelpa))))
;;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
