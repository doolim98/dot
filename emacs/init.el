(prefer-coding-system 'utf-8)
(setq custom-file (concat user-emacs-directory ".custom.el"))
(load custom-file)

;; Turn Off backup and auto save
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Thanks daviwil! see https://github.com/daviwil/emacs-from-scratch
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; optimizations
(setq load-prefer-newer t)
(setq read-process-output-max (* 1024 1024))

;; appearance
(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 0)        ; Give some breathing room
(menu-bar-mode -1)            ; Disable the menu bar
(setq visible-bell nil)
(toggle-scroll-bar -1)
(setq use-dialog-box t)
(setq use-file-dialog nil)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq frame-resize-pixelwise t)


;; Column Number
(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
				term-mode-hook
				dired-mode-hook
				shell-mode-hook
				treemacs-mode-hook
				eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Dired Mode Hook
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

;; Set built-in packages
(setq show-paren-delay 0)
(setq show-paren-when-point-inside-paren t)
(show-paren-mode 1)
(save-place-mode)

(recentf-mode 1)

(use-package general
  :after evil
  :config
  (general-create-definer my-define-keys/leader-key
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my-define-keys/leader-key
    "t"  '(:ignore t :which-key "toggles & chooses")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "SPC s" '(counsel-load-theme :which-key "choose theme")
    "xr" '(lambda () (interactive) (load-my-file "init.el") :which-key "reload init.el")
    ))

(use-package undo-tree
  :config
  ;; just let evil mode use undo-tree with c-/ key bindings
  (defun undo-tree-overridden-undo-bindings-p () nil)
  (global-undo-tree-mode t)
  )

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode t)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-normal-state-map (kbd "C-\/") 'comment-line)
  (define-key evil-visual-state-map (kbd "C-\/") 'comment-dwim)
  (define-key evil-normal-state-map (kbd ":") 'counsel-M-x)
  (define-key evil-normal-state-map (kbd "C-x") nil)
  (define-key evil-normal-state-map (kbd "RET") 'recenter-top-bottom)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Key bindings
(defun my/define-keys()
  (interactive)
  (global-set-key (kbd "C-x R") (lambda()(interactive)(load-my-file "init.el")))
  (define-key key-translation-map (kbd "ESC") (kbd "C-g"))
  )
(my/define-keys)

(use-package command-log-mode
  :commands command-log-mode)


(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))


(use-package ivy
  :diminish
  :bind
  (("C-s" . swiper)
   :map ivy-minibuffer-map
   ("TAB" . ivy-alt-done)
   :map ivy-switch-buffer-map
   :map ivy-reverse-i-search-map
   ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy-height 20)
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(if nil
    (use-package ivy-posframe
      :config
      ;; display at `ivy-posframe-style'
      (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
      ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
      ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
      ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
      ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
      ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
      (setq ivy-posframe-parameters
	    '((left-fringe . 8)
	      (right-fringe . 8)))
      (ivy-posframe-mode nil)
      )
  )

(use-package counsel
  :config
  (counsel-mode 1))

(use-package hydra
  :defer t)

(defun load-my-file (file)
  (interactive)
  (let ((default-directory my-emacs-directory))
    (load-file (expand-file-name file))))

(load-my-file "gui.el")
(load-my-file "org.el")
(load-my-file "dev.el")
(load-my-file "layout.el")
