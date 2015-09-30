(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(defalias 'yes-or-no-p 'y-or-n-p)
(require 'autopair)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq paren-highlight-offscreen t)

(column-number-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) 
(setq-default c-basic-offset 4)
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(auto-fill-mode 1)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 100) 
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)

(require 'ede)
(global-ede-mode)

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'find-things-fast)
(global-set-key [f2] 'ftf-find-file)
(global-set-key [f3] 'ftf-grepsource)
(global-set-key [f4] 'ftf-gdb)
(global-set-key [f5] 'ftf-compile)
(setq compile-command "./rops build -j50 -k100")

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(add-to-list 'load-path (expand-file-name "~/elisp"))

(require 'ctags-update)
(ctags-auto-update-mode 1)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-smart-tab-mode)


(setq tags-table-list
      '("/home/klakshmanan/Code/av/source/TAGS"))

(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-region)
