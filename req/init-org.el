;;; init-org.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package org-bullets
  :straight t
  :hook (org-mode . org-bullets-mode))

(provide 'init-org)

;;; init-org.el ends here
