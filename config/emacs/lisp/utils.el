;; utils

(defun my-require-package(pack &optional cmds)
  (progn
	(print pack)
  (unless (package-installed-p pack)
	; (package-refresh-contents)
	(package-install pack))
  (print cmds)
  (if (not (equal cmds nil)) (eval cmds))
  ))
