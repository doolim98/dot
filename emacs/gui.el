;; Theme
(progn 
  (progn ;; default theme
    (set-background-color "white smoke")
    (set-background-color "ghost white"))
  (use-package solarized-theme
    ;; :disabled 
    :init
    (setq x-underline-at-descent-line t)
    (load-theme 'solarized-light t)))

;; Font
(progn
  (defcustom my/font-height 120 "my-font-height")
  (setq my/font-unit 10)
  (setq my/default-font "Fira Code Retina")
  (setq my/fixed-pitch-font my/default-font)
  (setq my/variable-pitch-font "Cantarell")
  (defun my/update-faces()
    (set-face-attribute 'default nil :font my/default-font :height my/font-height)
    (set-face-attribute 'fixed-pitch nil :font my/fixed-pitch-font :height my/font-height)
    (set-face-attribute 'variable-pitch nil :font my/variable-pitch-font :height my/font-height :weight 'regular)
    ;; Hangul
    (set-fontset-font "fontset-default" '(#x1100 . #xffdc) '("NanumGothicCoding" . "iso10646-1"))
    (customize-save-customized))

  (defun my/increase-faces()
    (interactive)
    (custom-set-variables (list 'my/font-height (+ my/font-height my/font-unit)))
    (my/update-faces))

  (defun my/decrease-faces()
    (interactive)
    (custom-set-variables (list 'my/font-height (- my/font-height my/font-unit)))
    (my/update-faces))

  (defhydra hydra-face-scale (:timeout 4)
    "scale face"
    ("j" my/decrease-faces "-")
    ("k" my/increase-faces "+")
    ("ESC" nil "finished" :exit t))
  ;; init
  (my/update-faces)
  ;; key
  (my-define-keys/leader-key
    "fs" '(hydra-face-scale/body :which-key "face scale")))

;; Mode-line 
(progn
  )
