
;;; Code:
(use-package yasnippet-snippets
  :straight t)

(use-package yasnippet
  :straight t
  :defer t
  :bind (:map yas-minor-mode-map
              ("C-'" . yas-expand))
  :commands (yas-minor-mode)
  :hook ((prog-mode . yas-minor-mode))
  :config (yas-reload-all)
  :diminish yas-minor-mode)


(provide 'init-snippet)

;;; init-snippet.el ends here
