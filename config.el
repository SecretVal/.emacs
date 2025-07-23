(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(setq initial-buffer-choice t)
(setq make-backup-files nil)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq scroll-margin 15)

(which-key-mode 1)
(global-auto-revert-mode)

(setq-default show-trailing-whitespace t)

(savehist-mode 1)
(recentf-mode 1)
(global-eldoc-mode 1)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :demand t
  :config
  (general-create-definer keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(use-package which-key
  :ensure nil
  :init (which-key-mode))

(use-package move-text
  :config
  (global-set-key (kbd "M-K") 'move-text-up)
  (global-set-key (kbd "M-J") 'move-text-down))

(use-package beacon
  :config
  (beacon-mode))

(use-package dired
  :ensure nil
  :custom
  dired-listing-switches "-alh"
  dired-mouse-drag-files t
  :init
  (setq-default dired-dwim-target t)
  :config
  (keys
    "f" 'find-files))

(use-package multiple-cursors)

(use-package marginalia
  :config
  (marginalia-mode))

(use-package vertico
  :init
  (setq vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (setq vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :config
  (vertico-mode))

(use-package consult
  :config
  (keys
   "b" 'consule-buffers))

(use-package corfu
  :init
  (setq corfu-cycle t)
  (setq corfu-auto t)
  (setq corfu-auto-prefix 2)
  (setq corfu-auto-delay 0.0)
  (setq corfu-echo-documentation 0.25)
  (setq corfu-preview-current 'insert)
  (setq corfu-preselect-first nil)
  :config
  (global-corfu-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic))
  (setq completion-category-overrides '((file (styles basic partial-completion)))))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package magit
  :config
  (magit-auto-revert-mode)
  (keys
   "g s" 'magit))

(use-package magit-todos
  :after magit
  :config
  (magit-todos-mode 1))

(use-package forge
  :after magit)

(use-package projectile
  :init
  (when (file-directory-p "~/Documents/coding")
    (setq projectile-project-search-path '("~/Documents/coding")))
  (setq projectile-switch-project-action #'projectile-dired)
  :config
  (projectile-mode)
  (keys
   "p" 'projectile-command-map))

(use-package org
  :init
  (setq org-startup-indented t))

(use-package org-roam
  :after org
  :init
  (setq org-roam-directory "~/org-roam/")
  :config
  (org-roam-db-autosync-mode))

(use-package org-modern
  :after org
  :init
  (setq org-modern-star 'replace)
  :config
  (global-org-modern-mode))

(use-package nix-ts-mode
  :mode "\\.nix\\'")

(use-package direnv
  :config
  (direnv-mode))


(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-bright :no-confirm))
