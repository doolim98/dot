;; autocompletion, LSP, liter, syntax highlighter ....
;; git 
;; company.el, eglot.el corfu.el, 

(my-require-package 'magit)
(my-require-package 'company '(progn
								(global-company-mode 1)
								(setq company-idle-delay 0)
								(setq company-minimum-prefex-length 1)))
(my-require-package 'eglot)


;; MISC
;; collapse functions, outline
;; hs-minor-mod or outline-mode

;; snippets
;; yasnippet
