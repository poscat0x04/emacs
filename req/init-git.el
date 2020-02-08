;;; init-git.el --- Git is awesome -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; The awesome git client
(use-package magit
  :straight t
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-status-margin
        '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))


;; highlight uncommitted changes using git
(use-package diff-hl
  :straight t
  :hook ((prog-mode . (lambda ()
                        (diff-hl-mode)
                        (diff-hl-flydiff-mode)
                        (diff-hl-margin-mode)))
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; Git related modes
(use-package gitattributes-mode
  :straight t)
(use-package gitconfig-mode
  :straight t)
(use-package gitignore-mode
  :straight t)

(provide 'init-git)

;;; init-git.el ends here
