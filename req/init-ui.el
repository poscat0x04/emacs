;;; init-ui.el --- Theme and modeline -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package all-the-icons
  :straight t)

(use-package doom-themes
  :straight t
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :straight t
  :hook (after-init . doom-modeline-mode))

(use-package golden-ratio
  :straight t
  :hook (after-init . golden-ratio-mode)
  :custom (golden-ratio-auto-scale t))

(provide 'init-ui)

;;; init-ui.el ends here
