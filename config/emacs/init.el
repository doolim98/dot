;; Highly referred to https://www.taingram.org/init.html

;; load config files
(mapc 'load-file 
  (mapcar (lambda (x) (concat user-emacs-directory "lisp/" x ))
   '("prologue.el" "utils.el" "keymap.el" "layout.el" "file.el" "viye.el" "dev.el" "misc.el")))

;; Reload Keybinding should always work

;; Package Settings
(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(package-initialize)
; (package-refresh-contents)


;; Builtin pacakges or modes
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; appearance
(setq-default cursor-type 'bar)
(setq show-paren-mode 'expression)
(setq show-paren-delay 0)
(show-paren-mode t)

