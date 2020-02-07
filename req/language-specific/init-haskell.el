;;; init-haskell.el --- Haskell -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:
(use-package haskell-mode
  :ensure t
  :init
  (unless (fboundp 'align-rules-list)
    (defvar align-rules-list nil))
  (add-to-list 'align-rules-list
               '(haskell-types
                 (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-assignment
                 (regexp . "\\(\\s-+\\)=\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-arrows
                 (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  (add-to-list 'align-rules-list
               '(haskell-left-arrows
                 (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                 (modes quote (haskell-mode literate-haskell-mode))))
  :bind (("C-x a a" . align)
         :map haskell-mode-map
         ("C-c h" . hoogle)
         ("C-o"   . open-line)
         ("C-c C-c" . haskell-compile)
         ("C-c C-t" . haskell-process-do-type)
         ("C-c C-i" . haskell-process-do-info)
         :map haskell-cabal-mode-map
         ("C-c h" . hoogle)
         ("C-c C-c" . haskell-compile)
         ("C-`"     . haskell-interactive-mode-collapse))
  :custom
    (haskell-compile-cabal-build-command "stack build --profile --ghc-options=-Wall")
    (haskell-compile-command "ghc -dynamic -Wall -ferror-spans -fforce-recomp -c %s")
    (haskell-indentation-layout-offset            4)
    (haskell-indentation-left-offset              4)
    (haskell-process-suggest-haskell-docs-imports t)
    (haskell-process-suggest-remove-import-lines  t)
    (haskell-process-log                          t)
    (haskell-process-suggest-hoogle-imports       t)
    (haskell-tags-on-save                         t)
    (haskell-stylish-on-save                      t)
    (inhibit-startup-screen                       t))

(use-package lsp-haskell
  :ensure t
  :hook (haskell-mode . lsp)
  :custom
  (lsp-haskell-process-path-hie "hie-wrapper"))

(straight-use-package 'haskell-snippets)

(provide 'init-haskell)

;;; init-haskell.el ends here
