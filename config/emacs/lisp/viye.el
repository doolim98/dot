;; viye(bye vim~) mode, very very simple scripts for vim keybindings(I hate evil mode)
; (setq viye-state '#1(normal ) ;; 0: noraml
(defun viye-backward-char() (interactive) (backward-char))
(defun viye-forward-char() (interactive) (forward-char))
(defun viye-next-line() (interactive) (next-line))
(defun viye-previous-line() (interactive) (previous-line))
(defun viye-visual-mode() (interactive) (set-mark-command))

(defun viye-define-all-translations(trans)
  (if (not (eq nil trans))
	(let* ((tr (pop trans))
		   (src (nth 0 tr))
		   (dst (nth 1 tr)))
	  (progn 
		(define-key key-translation-map (kbd src) (kbd dst))
		(print (cons src dst))
		(viye-define-all-translations trans)))))
(setq viye-normal-map
'(("w" "M-f")
  ("b" "M-b")
  ("h" "C-b")
  ("j" "C-n")
  ("k" "C-p")
  ("l" "C-f")))
(defun viye-normal-map()
  (viye-define-all-translations '(("w" "M-f")
								  ("b" "M-b")
								  ("h" "C-b")
								  ("j" "C-n")
								  ("k" "C-p")
								  ("l" "C-f"))))

;; set-mark-command

;; in insert-mode unset all vim keybindings
;; in normal-mode set all vim keybindgs using viye

;; TODO hook every C-n C-p(maybe also 'n','p') to jk it should work for almost every modes.
;; jk -> emulate C-n C-p
;; remap C-n C-p?
;; C-n C-p -> M-n M-p
;; References
;; https://emacs.stackexchange.com/questions/2461/how-can-i-simulate-an-arbitary-key-event-from-elisp
;; buffer-list-update-hook
;; after-change-major-mode-hook

; (add-hook 
