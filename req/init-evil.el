;;; init-evil.el --- Bring vim back -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package evil
  :straight t
  :diminish evil
  :hook (after-init . evil-mode)
  :config
  (setcdr evil-insert-state-map nil)
  :bind (:map evil-motion-state-map
         ("C-u" . scroll-down-command)
         :map evil-insert-state-map
         ([escape] . evil-normal-state)
         :map evil-normal-state-map
         ("M-." . xref-find-definitions)
         ))

(use-package evil-leader
  :straight t
  :custom (evil-leader/leader "<SPC>")
  :config
  (global-evil-leader-mode)
  (evil-leader/set-key
    "f" 'find-file-at-point)
  )

(use-package evil-nerd-commenter
  :straight t
  :config
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines))

(use-package evil-surround
  :straight t
  :hook (prog-mode . evil-surround-mode))

(use-package evil-magit
  :straight t
  :after evil magit)

(provide 'init-evil)

;;; init-evil.el ends here
