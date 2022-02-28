(prefer-coding-system 'utf-8)
(setq custom-file (concat user-emacs-directory ".custom.el"))

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


;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
;(setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; No visible-bell
(setq visible-bell nil)

(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Font
(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 150)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 150 :weight 'regular)


(use-package general
  ; :after evil
  ; :config
  ; (general-create-definer efs/leader-keys
  ;   :keymaps '(normal insert visual emacs)
  ;   :prefix "SPC"
  ;   :global-prefix "C-SPC")

  ; (efs/leader-keys
  ;   "t"  '(:ignore t :which-key "toggles")
  ;   "tt" '(counsel-load-theme :which-key "choose theme")
  ;   "fde" '(lambda () (interactive) (find-file (expand-file-name "~/.emacs.d/Emacs.org")))))
)


(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  ; (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  ; (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

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
  :bind (("C-s" . swiper)
         ; :map ivy-minibuffer-map
         ; ("TAB" . ivy-alt-done)
         ; ("C-l" . ivy-alt-done)
         ; ("C-j" . ivy-next-line)
         ; ("C-k" . ivy-previous-line)
         ; :map ivy-switch-buffer-map
         ; ("C-k" . ivy-previous-line)
         ; ("C-l" . ivy-done)
         ; ("C-d" . ivy-switch-buffer-kill)
         ; :map ivy-reverse-i-search-map
         ; ("C-k" . ivy-previous-line)
         ; ("C-d" . ivy-reverse-i-search-kill)
		 )
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))


(use-package counsel
  ; :bind (("C-M-j" . 'counsel-switch-buffer)
  ;        :map minibuffer-local-map
  ;        ("C-r" . 'counsel-minibuffer-history))
  ; :custom
  ; (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))


(use-package hydra
  :defer t)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(defun load-file-from-user-emacs-directory (file-path)
  (load-file (concat user-emacs-directory file-path)))
(load-file-from-user-emacs-directory "org.el")
(load-file-from-user-emacs-directory "dev.el")
