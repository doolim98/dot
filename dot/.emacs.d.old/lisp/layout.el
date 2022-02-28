;; 

;; my layout scripts
(my-require-package 'ivy '(ivy-mode))
(my-require-package 'ivy-posframe '(ivy-posframe-mode 1))
(my-require-package 'delight)


;; font settings
(defvar my-font-sizes '#1=(100 150 200 . #1#))
(setq my-font "DejaVuSansMono")

(defun apply-font()
	(set-face-attribute 'default nil :font my-font :height (car my-font-sizes)))
(apply-font)

(defun alter-font-sizes() 
  (interactive)
  (setq my-font-sizes (cdr my-font-sizes))
  (apply-font)
  )


;; should be setted after font config
; (set-frame-size (selected-frame) 1600 900 t)
