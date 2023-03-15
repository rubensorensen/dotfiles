;; Disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scrath-message nil)

;; Disable menu-bar, tool-bar and scroll-bar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Matching parantheses etc.
(electric-pair-mode 1)

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
(setq backup-directory-alist '(("." . "~/.emacs_backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs_saves/" t)))

;; Emacs theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("c4cecd97a6b30d129971302fd8298c2ff56189db0a94570e7238bc95f9389cfb" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(package-selected-packages
   '(php-mode csv-mode highlight-doxygen clang-format clang-format+ emmet-mode rust-mode browse-kill-ring zenburn-theme gruvbox-theme magit glsl-mode highlight-indentation dockerfile-mode yaml-mode markdown-mode pyvenv yasnippet auctex flyparens multiple-cursors gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Global key-bindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(define-key global-map "\ec" 'comment-line)
(define-key global-map [?\C-,] 'other-window)
(define-key global-map "\eu" 'undo)
(define-key global-map "\em" 'compile)
(define-key global-map "\en" 'next-error)
(define-key global-map "\ep" 'previous-error)
(define-key global-map "\ee" 'dabbrev-expand)
(define-key global-map (kbd "C-x <tab>") 'yas-expand)
(define-key global-map (kbd "C-j") 'join-line)

(setq-default indent-tabs-mode nil)

;; C-mode
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode nil)
(c-set-offset 'case-label '+)
;; (define-key c-mode-map "\e." 'c-fill-paragraph)

;; Clang-format stuff
(require 'clang-format)
(setq clang-format-style "file")

;; LaTeX-mode

(defun put-tex-figure ()
  (interactive)
  (setq fig-dir (read-directory-name "Enter figure directory: "))
  (setq fig-name (read-string "Enter figure name: "))
  (setq cmd (concat "inkscape-figures create " fig-name " " fig-dir " 2> /dev/null"))
  (insert (shell-command-to-string cmd)))

(defun edit-tex-figure ()
  (interactive)
  (setq fig-dir (read-directory-name "Enter figure directory: "))
  (setq cmd (concat "inkscape-figures edit " fig-dir " 2> /dev/null"))
  (shell-command cmd))

(define-key global-map (kbd "C-x f") 'put-tex-figure)
(define-key global-map (kbd "C-x e") 'edit-tex-figure)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
