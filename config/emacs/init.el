;; Unset UI elements

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Load package manager

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" , "http://melpa.org/packages/"))

;; Delete selected text when entering new chars

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(let ((font "mono-spaced-nerd-font"))
  (set-face-attribute 'default nil :family font :height 100)
  (set-face-attribute 'fixed-pitch nil :family font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family font :height 1.0))

;; Themes

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi-tinted :no-confirm-loading))

;; Gambit related

(add-to-list 'load-path "~/.emacs.d/gambit/")
(require 'gambit)

;; Window related

(global-set-key (kbd "M-o") 'ace-window)

;; Indent Functions

(electric-indent-mode 1)

(defun indent-current-fun ()
  "Indent the current defun."
  (interactive)
  (save-excursion
    (mark-defun)
    (indent-region (region-beginning) (region-end))))

(global-set-key (kbd "C-c i d") 'indent-current-fun)

;; break-time

(defun break-time ()
  "To use for a little break"
  (interactive)
  (shell-command "p"))

(global-set-key (kbd "C-x p") 'break-time)

;; Auo-generated

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ace-window modus-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
