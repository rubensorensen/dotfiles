;; Disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scrath-message nil)

;; Disable menu-bar, tool-bar and scroll-bar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Use ido mode
(ido-mode 1)

;; Add melpa package support
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Font
(set-frame-font "UbuntuMono Nerd Font 14" nil t)

;; Startup window setup
(split-window-horizontally)

;; Smooth scroll
(setq scroll-step 3)

;; Set backup directory
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; Emacs theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(package-selected-packages '(gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Global key-bindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(define-key global-map "\ec" 'comment-line)
(define-key global-map [?\C-,] 'other-window)
(define-key global-map "\eu" 'undo)

;; C-mode key-bindings
;; (define-key c-mode-map "\e." 'c-fill-paragraph)
