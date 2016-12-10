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
(setq allowInstall (getenv "EMACS_INSTALL"))
;; quelpa
(defun nlx-quelpa-install()
  (package-refresh-contents)
  (if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer))))
(if allowInstall (nlx-quelpa-install))

(require 'quelpa)
(defvar config:packages)
(setq  config:packages '(
    ; evil
    evil
    evil-leader
    ; gui
    color-theme
    color-theme-solarized
    linum-relative
    ; git
    magit
    evil-magit
    git-gutter
    ; dev tools
    flycheck
    auto-complete
    ac-js2
    yasnippet
    auto-yasnippet
    
    grizzl ; projectile deps
    projectile
    ag
    ;filetypes packages:
    blank-mode
    json-mode
    js2-mode
    js2-refactor
    web-mode
    dockerfile-mode
    yaml-mode
    markdown-mode
    less-css-mode
    skewer-mode
    scss-mode
    sass-mode
    ;; perspective
    ;; persp-projectile
    ;; ;; file type
    ;; json-reformat
    ;; json-snatcher
))

(defun autoinstall-packages ()
  "Install packages from config:package variable."
  (dolist (p config:packages)
     (quelpa  p)))

(defun autorequire ()
  "Install packages from config:package variable."
  (dolist (p config:packages)
     (require p)))

(if allowInstall (autoinstall-packages) (autorequire))
(if allowInstall (kill-emacs))

(require 'core-conf)
(require 'evil-conf)
(require 'magit-conf)
(require 'keybind-conf)

;for refactoring
;ac
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
(setq-default ac-sources '(
                           ac-source-yasnippet
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers
                           ))
;yasnipets
(require 'yasnippet)

;; Set Yasnippet's key binding to shift+tab
(setq yas-snippet-dirs "~/.emacs.d/snippets")
(yas-global-mode 1)
(setq warning-suppress-types '(
                               (yasnippet backquote-change)
                               ))

;;utils
(defun show-major-mode ()
  "Show major modes."
  (interactive)
  (message "%s" major-mode))
;;
(require 'projectile)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
(projectile-discover-projects-in-directory "~/src")
;; modes
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
(add-hook 'js2-jsx-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
(add-hook 'js2-jsx-mode-hook 'js2-refactor-mode)
(setq js2-mode-show-parse-errors nil)
;; (setq ac-js2-external-libraries '("full/path/to/a-library.js"))

(defun my/use-eslint-from-node-modules () )
(defun use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook 'use-eslint-from-node-modules)

(defun flycheck-js ()
;;  (flycheck-select-checker 'javascript-eslint)
  (js2-mode-hide-warnings-and-errors)
)
(add-hook 'js2-jsx-mode-hook 'flycheck-js)

  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        js-indent-level 2
        js2-bounce-indent-p t
        )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-yasnippet yasnippet markdown-mode yaml-mode dockerfile-mode js2-mode json-mode json-snatcher json-reformat auto-complete popup flycheck pkg-info epl blank-mode git-gutter evil-magit magit magit-popup git-commit with-editor dash async linum-relative color-theme-solarized evil-leader quelpa)))
 '(tab-always-indent (quote complete)))
;;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
