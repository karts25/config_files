;;; emacs-config --- my personal .emacs.el

(load "package")
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list `load-path "~/.emacs.d/styles")
(setq package-archive-enable-alist '(("melpa" deft magit)))

(defalias 'yes-or-no-p 'y-or-n-p)
(require 'autopair)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq paren-highlight-offscreen t)

;; ----- Neotree for folder navigation -----
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; ------ Find things fast for project navigation -----
(require 'find-things-fast)
(global-set-key [f2] 'ftf-find-file)
(global-set-key [f3] 'ftf-grepsource)
(global-set-key [f4] 'ftf-gdb)
(global-set-key [f5] 'ftf-compile)

;; Switch between header and source
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

:config
(setq ftf-filetypes
      '("*.dart" "*.tmpl" "*.js" "*.gni" "*.gn" "*.mojom" "*.h" "*.hpp"
	"*.cpp" "*.c" "*.cc" "*.cpp" "*.inl" "*.grd" "*.idl" "*.m" "*.mm"
	"*.h" "*.hh" "*.proto"
	"*.py" "*.sh" "*.cfg" "*SConscript" "SConscript*" "*.scons"
	"*.vcproj" "*.vsprops" "*.make" "*.gyp" "*.gypi" "*.el" "*.md"))
;;(require 'no-easy-keys)
;;(no-easy-keys 1)
;; -------------------------------------------------
;;
(setq compile-command "bazel build ...")

(add-hook 'after-init-hook 'global-smart-tab-mode)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(setq c-default-style "linux"
      c-basic-offset 4)
(require 'google-c-style)
;;(load-file "~/.emacs.d/styles/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(setq-default fill-column 100)
(add-hook 'c-mode-common-hook 'fci-mode 1)

;; Useful keyboard shortcuts
(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "C-z") 'undo)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook `after-init-hook (lambda() (load-theme 'badger)))
;; On save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
