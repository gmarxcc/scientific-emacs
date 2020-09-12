;;; My basic configuration Gerardo Marx 31/Jul/2020
;;--------
;; Melpa repository:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; frame size at start
(setq initial-frame-alist '((top . 10)(left . 20)
			    (width . 80)(height . 40)))
;; which-key:
(use-package which-key
  :ensure t
  :config (which-key-mode))
;; doom-themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled  
  (load-theme ;'doom-one
   'doom-monokai-pro t) ;'doom-tomorrow-day
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
    ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
;; icons:
(use-package all-the-icons
  :ensure t) ;; --> you need this M-x all-the-icons-install-fonts
;; helm package:
(use-package helm
  :ensure t
  :demand t
  :bind (("M-x" . helm-M-x)
	 ("C-c h x" . helm-register)    ; C-x r SPC and C-x r j
	 ("C-c h g" . helm-google-suggest)
	 ("C-c h M-:" . helm-eval-expression-with-eldoc)
	 ("C-x C-f" . helm-find-files))
  :config
 (require 'helm-config)
  (helm-mode t))
;; projectile:
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode t))
;; helm-projectile:
(use-package helm-projectile
  :after projectile
  :ensure t
  :init
  (require 'tramp)
  :config
  (helm-projectile-on))
;; temp:
(setq ido-enable-flex-matching t)
;; dash-board:
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 5)
			    (bookmarks . 5)
			    (projects . 5)
			    ;;(agenda . 5)
			    ))
    (setq dashboard-banner-logo-title "Welcome to Scientific-Emacs")
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-init-info t)
    (setq dashboard-startup-banner 'logo)
    )
  :config
  (dashboard-setup-startup-hook))
;; magit
(use-package magit
  :ensure t)
;; expand region
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

;; latex
(use-package tex
  :defer t
  :ensure auctex
  :init
  (progn
    (setq-default TeX-master nil) ; Query for master file.
    (setq TeX-auto-save t) ; Enable parse on save.
    (setq TeX-save-query nil)
    (setq LaTeX-includegraphics-read-file 'LaTeX-includegraphics-read-file-relative)
    (custom-set-variables '(LaTeX-command "latex -synctex=1"))
    ;;(setq TeX-command-force "LaTex")
    ;;(setq latex-run-command "pdflatex")
    (setq TeX-parse-self t) ; Enable parse on load.
    (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
    (setq exec-path (append exec-path '("/Library/TeX/texbin/")))
    ;; pdf-tools configuration
    (setq TeX-PDF-mode t)
      (add-hook 'TeX-after-compilation-finished-functions
	    #'TeX-revert-document-buffer)
    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
	 TeX-source-correlate-start-server t)
    (setq pdf-info-epdfinfo-program "/usr/bin/epdfinfo")
    (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
    (add-hook 'pdf-view-mode-hook
	      (lambda () (pdf-tools-enable-minor-modes))) 
    )
  :config
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (company-mode)
              (turn-on-reftex)
              (setq reftex-plug-into-AUCTeX t)
              (reftex-isearch-minor-mode))
  ))
  
;; pdf-tools
(use-package pdf-tools
  :ensure t
  :pin melpa
  :magic ("%PDF" . pdf-view-mode)
  :config
   (custom-set-variables
     '(pdf-tools-handle-upgrades nil)) 
   )
;; ----------
;; rextex
(use-package reftex
  :ensure t
  :defer t
  :config
  (setq reftex-cite-prompt-optional-args t)); Prompt for empty optional arguments in cite
;; Company-mode
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))
;; ispell
(dolist (hook '(org-mode-hook latex-mode-hook tex-mode-hook git-commit-mode-hook))
	(add-hook hook (lambda () (flyspell-mode 1))))
;;(setq ispell-dictionary "en")
(setq ispell-program-name "/usr/bin/aspell")
;;-+-+-+-+-+-+-+-



;; -+-+-+-+-+-+-+
;; startup config
(setq inhibit-startup-message t) ;;inhibit startup
(show-paren-mode 1) ;; parenthesis match 
(tool-bar-mode -1) ;; no tool-bar
(menu-bar-mode -1) ;; menu-bar disable  
(global-hl-line-mode +1) ;; highlith current line
(delete-selection-mode +1) ;; deletes selected text and replace it
(scroll-bar-mode -1)
;; Set default font:
(add-to-list 'default-frame-alist
	     '(font . "DejaVu Sans Mono-16"))
(fset 'yes-or-no-p 'y-or-n-p) ;; Ask y/n instead of yes/no
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; display line number when programming
(setq x-alt-keysym 'meta)
;; -+-+-+-+-+-+-+-



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" default)))
 '(package-selected-packages (quote (org-pdftools use-package)))
 '(pdf-tools-handle-upgrades nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
