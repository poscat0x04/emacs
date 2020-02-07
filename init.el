;;; init.el --- The main entry for emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Defer GC
(setq gc-cons-threshold 100000000)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'exec-path-from-shell)
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "req/language-specific" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "req" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-generic)
(require 'init-evil)
(require 'init-lsp)
(require 'init-org)
(require 'init-git)
(require 'init-ui)
(require 'init-startup)
(require 'init-tools)
(require 'init-dev)

(provide 'init)

;;; init.el ends here
