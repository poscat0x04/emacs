
;;; Code:

(use-package flycheck-aspell
  :straight (flycheck-aspell :type git
                             :host github
                             :repo "leotaku/flycheck-aspell")
  :init (add-to-list 'flycheck-checkers 'tex-aspell-dynamic)
  :custom
  (ispell-dictionary "english.alias")
  (ispell-program-name "aspell")
  (ispell-silently-savep t))

(provide 'init-nat)

;;; init-nat.el ends here
