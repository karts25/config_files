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

(add-to-list 'load-path "/Code/av/source")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'find-things-fast)
(global-set-key [f2] 'ftf-find-file)
(global-set-key [f3] 'ftf-grepsource)
(global-set-key [f4] 'ftf-gdb)
(global-set-key [f5] 'ftf-compile)

(add-to-list 'ftf-filetypes "*.hh")
(add-to-list 'ftf-filetypes "*.hidl")

(setq compile-command ". compile_command.sh")

(add-hook 'after-init-hook #'global-flycheck-mode)

;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(add-to-list 'load-path (expand-file-name "~/elisp"))

;; Auto complete

 ;; (require 'company)
 ;; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-smart-tab-mode)
 ;; (eval-after-load 'company
 ;; '(add-to-list 'company-backends 'company-irony))
 ;; (require 'ycmd) ;; (add-hook 'after-init-hook #'global-ycmd-mode)
;; (set-variable 'ycmd-server-command '("python" "/home/klakshmanan/.emacs.d/elpa/ycmd-20150721.55"))
;; (require 'flycheck-ycmd)
;; (flycheck-ycmd-setup)
;; (require 'company-ycmd)
;; (company-ycmd-setup)

;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)                  
;; (yas-global-mode 1)
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(custom-set-variables
  '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
      (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
 (ac-set-trigger-key "TAB")
 (ac-set-trigger-key "<tab>")

;; (require 'flymake-cppcheck)
;; (add-hook 'c-mode-hook 'flymake-cppcheck-load)
;; (add-hook 'c++-mode-hook 'flymake-cppcheck-load)


;; Auto formatting
;; (load "/home/klakshmanan/.emacs.d/elpa/clang-format-20150510.47/clang-format.el")
;; Hook function
;; (defun clang-format-before-save ()
;;   "Add this to .emacs to clang-format on save
;;  (add-hook 'before-save-hook 'clang-format-before-save)."

;;   (interactive)
;;   (when (eq major-mode 'c++-mode) (clang-format-buffer)))

;; ;; Install hook to use clang-format on save
;; (add-hook 'before-save-hook 'clang-format-before-save)

(setq c-default-style "linux"
          c-basic-offset 4)
;; Etags
;; (defadvice find-tag (around refresh-etags activate)
;;    "Rerun etags and reload tags if tag not found and redo find-tag.              
;;    If buffer is modified, ask about save before running etags."
;;   (let ((extension (file-name-extension (buffer-file-name))))
;;     (condition-case err
;;     ad-do-it
;;       (error (and (buffer-modified-p)
;;           (not (ding))
;;           (y-or-n-p "Buffer is modified, save it? ")
;;           (save-buffer))
;;          (er-refresh-etags extension)
;;          ad-do-it))))

;; (defun er-refresh-etags (&optional extension)
;;   "Run etags on all peer files in current dir and reload them silently."
;;   (interactive)
;;   (shell-command (format "etags *.%s" (or extension "el")))
;;   (let ((tags-revert-without-query t))  ; don't query, revert silently          
;;     (visit-tags-table default-directory nil)))
 
(require 'ctags-update)
(ctags-auto-update-mode 1)

(setq tags-table-list
      '("/home/klakshmanan/Code/av/source/TAGS"))

;; Useful keyboard shortcuts
(define-key map (kbd "RET") 'etags-select-goto-tag)
(define-key map (kbd "M-RET") 'etags-select-goto-tag-other-window)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-z") 'undo)
 
