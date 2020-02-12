;;; init-ui.el --- Theme and modeline -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package doom-themes
  :straight t
  :config
  (load-theme 'doom-nord t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :straight t
  :hook (after-init . doom-modeline-mode))

(use-package golden-ratio
  :straight t
  :hook (after-init . golden-ratio-mode)
  :custom (golden-ratio-auto-scale t))

(provide 'init-ui)

;;; init-ui.el ends here
