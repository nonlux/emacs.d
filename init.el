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
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
(with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer))))

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
  (package-refresh-contents)
  (dolist (p config:packages)
     (quelpa  p)
     (require p)))

;(nlx-quelpa-install)
;; (autoinstall-packages)



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

;;; init.el ends here

