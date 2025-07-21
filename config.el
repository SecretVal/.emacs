(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

(setq make-backup-files nil)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq scroll-margin 15)

(which-key-mode 1)
(global-auto-revert-mode)

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :init (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  )


(defun c/org-hook ()
  (org-indent-mode))
(use-package move-text
  :config
  (global-set-key (kbd "M-p") 'move-text-up)
  (global-set-key (kbd "M-n") 'move-text-down)
  )

(use-package beacon
  :config (beacon-mode))

(use-package dired
  :ensure nil
  :custom
  dired-listing-switches "-alh"
  dired-mouse-drag-files t
  :init
  (setq-default dired-dwim-target t))

(use-package multiple-cursors)
(use-package general)
(general-create-definer u/keys
  :prefix "C-c")

(u/keys
  "k" 'compile
  "j" 'recompile 
  "i" 'ibuffer
  "c" 'count-words
  "s i" 'mc/edit-lines
  "s a" 'mc/mark-all-like-this
  "s n" 'mc/mark-next-like-this
  "s p" 'mc/mark-previous-like-this
  "s l n" 'mc/mark-next-lines
  "s l p" 'mc/mark-previous-lines
  )


(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t)
  )

(use-package marginalia
  :init
  (marginalia-mode))

;; Enable vertico
(use-package vertico
  :custom
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package consult
  :config
  (u/keys
    "b" 'consult-buffer
    ))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-echo-documentation 0.25)
  (corfu-preview-curremt 'insert)
  (corfu-preselect-first nil)
  :init
  (global-corfu-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package magit
  :init
  (magit-auto-revert-mode)
  :config
  (u/keys
    "gs" 'magit))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  (u/keys
    "p" 'projectile-command-map)
  :init
  (when (file-directory-p "~/Documents/coding")
    (setq projectiles-project-search-path '("~/Documents/coding")))
  (setq projectiles-switch-project-action #'projectile-dired))

(use-package org
  :hook (org-mode . c/org-hook)
  :custom
  org-startup-indented t
  )

(use-package org-superstar
  :after org
  :custom
  (org-superstar-leading-bullet " ")
  :hook (org-mode . org-superstar-mode))

(use-package direnv
  :config
  (direnv-mode))

(use-package gruvbox-theme
    :config
    (load-theme 'gruvbox-dark-medium :no-confirm))

(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))
