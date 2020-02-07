;;; init-ui.el --- Theme and modeline -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package all-the-icons
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom (golden-ratio-auto-scale t))

(provide 'init-ui)

;;; init-ui.el ends here
