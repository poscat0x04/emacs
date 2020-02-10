
;;; Code:

(use-package purescript-mode
  :straight t)

(use-package psci
  :straight t
  :hook (purescript-mode . inferior-psci-mode))

(use-package psc-ide
  :straight t
  :hook
  (purescript-mode . (lambda ()
                       (psc-ide-mode)
                       (turn-on-purescript-indentation))))

(provide 'init-purs)

;;; init-purs.el ends here
