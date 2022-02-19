;; essential configs, load ui first
(defun reload-emacs() (interactive) (load-file (concat user-emacs-directory "init.el")))
;; Early Settings (Load UI first)
(prefer-coding-system 'utf-8)
(setq custom-file (concat user-emacs-directory ".custom.el"))
;; disable all useless UI elements
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq use-dialog-box t)
(setq use-file-dialog nil)
(tooltip-mode -1)
(setq frame-resize-pixelwise t)
; set-frame-position
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(set-fringe-mode 0) ; Space at edges
;; optimizations
(setq load-prefer-newer t)
(setq read-process-output-max (* 1024 1024))
