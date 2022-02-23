(global-set-key (kbd "C-x C-r") 'reload-emacs)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; evil-mode
; (when nil

(progn 
  (my-require-package 'evil)
  (setq evil-want-C-u-scroll t)
  (evil-mode 1)
  (when evil-want-C-u-scroll
	(define-key evil-insert-state-map (kbd "C-u") 'evil-scroll-up)
	(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
	(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
	(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up))
  ;; clear all and always use evil mode
  (setq evil-emacs-state-modes nil)
  (setq evil-insert-state-modes nil)
  (setq evil-motion-state-modes nil)
  (setq evil-normal-state-modes
	(append evil-emacs-state-modes
		evil-insert-state-modes
		evil-normal-state-modes
		evil-motion-state-modes))
  (evil-set-inital-state 
  ))
