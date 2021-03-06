;;; init-tools.el --- We all like productive tools -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; Tips for next keystroke
(use-package which-key
  :straight t
  :diminish which-key-mode
  :hook (after-init . which-key-mode)
  :custom (which-key-idle-delay 0.5))

;; The blazing grep tool
(use-package rg
  :straight t
  :defer t)

;; fuzzy search
(use-package fzf
  :straight t
  :defer t)

;; Jump to arbitrary positions
(use-package avy
  :straight t
  :custom
  (avy-timeout-seconds 0.2)
  (avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p))
  :config
  ;; evil-leader keybindings
  (with-eval-after-load 'evil-leader
    (evil-leader/set-key
      "w" 'avy-goto-word-or-subword-1
      "e" 'avy-goto-end-of-line
      "s" 'avy-goto-char-timer
      "l" 'avy-goto-line))
  )

;; ivy core
(use-package ivy
  :straight t
  :diminish ivy-mode
  :init (setq ivy-use-virtual-buffers t
              ivy-count-format "%d/%d"
              ivy-display-style 'fancy)
  :bind (("C-c C-r" . ivy-resume))
  :hook (after-init . ivy-mode))

;; fuzzy matcher
(use-package counsel
  :straight t
  :diminish counsel-mode
  :hook (ivy-mode . counsel-mode)
  :bind (("M-y" . counsel-yank-pop)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-ibuffer))
  :custom
  (counsel-find-file-ignore-regexp "\\(?:\\`\\(?:\\.\\|__\\)\\|elc\\|pyc$\\)"))

;; DONT use swiper
(use-package isearch
  :ensure nil
  :custom
  (lazy-highlight-cleanup nil))

;; switch windows quickly
(use-package ace-window
  :straight t
  :preface
  (defun my/switch-window ()
    (interactive)
    (if (<= (count-windows) 2)
        (other-window 1)
      (ace-window 1)))
  :bind (:map global-map
         ("M-o" . my/switch-window))
  :config
  (set-face-attribute
   'aw-leading-char-face nil
   :foreground "deep sky blue"
   :weight 'bold
   :height 3.0)
  (set-face-attribute
   'aw-mode-line-face nil
   :inherit 'mode-line-buffer-id
   :foreground "lawn green")
  (setq aw-keys '(?a ?s ?d ?f ?h ?j ?k ?l)
        aw-scope 'frame
        aw-dispatch-always t
        aw-dispatch-alist '((?x aw-delete-window "Ace - Delete Window")
                            (?c aw-swap-window "Ace - Swap Window")
                            (?n aw-flip-window)
                            (?v aw-split-window-vert "Ace - Split Vert Window")
                            (?h aw-split-window-horz "Ace - Split Horz Window")
                            (?m delete-other-windows "Ace - Maximize Window")
                            (?g delete-other-windows)
                            (?b balance-windows)
                            (?u (lambda ()
                                  (progn
                                    (winner-undo)
                                    (setq this-command 'winner-undo))))
                            (?r winner-redo))))

;; The markdown mode is awesome! unbeatable
(use-package markdown-mode
  :straight t
  :custom
  (markdown-command "pandoc")
  (markdown-fontify-code-blocks-natively t)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

;; free hands
(use-package auto-package-update
  :straight t
  :custom
  (auto-package-update-delete-old-versions t))

;; beautiful term mode & friends
(use-package vterm
  :straight t
  :hook (vterm-mode . (lambda ()
                        (setq-local evil-insert-state-cursor 'box)
                        (evil-insert-state)))
  )

(use-package vterm-toggle
  :straight t
  :bind (:map global-map
         ("M-=" . vterm-toggle)
         :map vterm-mode-map
         ("<C-return>" . vterm-toggle-insert-cd))
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
               '("^v?term.*"
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . bottom)
                 (dedicated . t)
                 (reusable-frames . visible)
                 (window-height . 0.3)))
  )

;; GC optimization
(use-package gcmh
  :straight t
  :custom
  (gcmh-high-cons-threshold 100000000)
  (gcmh-idle-delay 300)
  :hook (after-init . gcmh-mode))

;; required by `comment-edit'
(use-package dash
  :straight t)

;; required by `comment-edit'
(use-package edit-indirect
  :straight t)

;; write documentation comment with in a easy way
(use-package comment-edit
  :straight t
  :straight (:host github :repo "twlz0ne/comment-edit.el")
  :custom
  (comment-edit-default-mode 'markdown-mode)
  (comment-edit-remove-trailing-spaces-in-comment t)
  :bind (:map prog-mode-map
          ("C-c '" . comment-edit)))

;; pastebin service
(use-package webpaste
  :straight t
  :custom
  (webpaste-paste-confirmation t)
  (webpaste-add-to-killring nil)
  (webpaste-provider-priority '("dpaste.org" "dpaste.com" "ix.io"))
  :config
  (add-hook 'webpaste-return-url-hook
            (lambda (url)
              (message "Opened URL in browser: %s" url)
              (browse-url url)))
  )

;; Edit text for browser with GhostText or AtomicChrome extension
(straight-use-package 'atomic-chrome)
(use-package atomic-chrome
  :hook ((emacs-startup . atomic-chrome-start-server)
         (atomic-chrome-edit-mode . delete-other-windows))
  :custom
  (atomic-chrome-buffer-open-style 'frame)
  (atomic-chrome-default-major-mode 'markdown-mode)
  :config
  (if (fboundp 'gfm-mode)
      (setq atomic-chrome-url-major-mode-alist
            '(("github\\.com" . gfm-mode)))))

;; Auto compile elisp
(straight-use-package 'auto-compile)
(use-package auto-compile
  :custom
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

;; grip-mode
(use-package grip-mode
  :straight t
  :hook ((markdown-mode org-mode) . grip-mode)
  :custom
  (grip-preview-use-webkit t))

(provide 'init-tools)

;;; init-tools.el ends here
