
;;; Code:

(use-package proof-general
  :straight t)

(use-package company-coq
  :straight t
  :ensure nil
  :hook (coq-mode . company-coq-mode)
  :custom
    (company-coq-features/prettify-symbols-in-terminals t))

(provide 'init-coq)

;;; init-coq.el ends here
