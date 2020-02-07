
;;; Code:

(straight-use-package 'proof-general)
(use-package proof-general)

(straight-use-package 'company-coq)
(use-package company-coq
  :ensure nil
  :hook (coq-mode . company-coq-mode)
  :custom
    (company-coq-features/prettify-symbols-in-terminals t))

(provide 'init-coq)

;;; init-coq.el ends here
