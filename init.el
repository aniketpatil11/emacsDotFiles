;; Add Main Repositories for Emacs packages
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Removes toolbar, scroll bar and menu bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Maximizes emacs on startup and removes title bar (borderless fullscreen)
(set-frame-parameter nil 'fullscreen 'fullboth) ;; this works for the emacs version from Yamamoto

;; Highlight Current Line
;;(add-hook 'after-init-hook 'global-hl-line-mode)

;; Highlight corresponding parentheses when cursor is on one
(setq show-paren-delay 0) ;; shows matching parenthesis asap
(show-paren-mode t)

;; Proper line wrapping
(global-visual-line-mode t)

;; Show trailing white spaces
;;(setq-default show-trailing-whitespace t)


;; Remove useless whitespace before saving a file
;;(add-hook 'before-save-hook 'whitespace-cleanup)
;;(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Adds Nice Icons to Emacs so that other themes can use them (required for Doom theme below)
;; run M-x all-the-icons-install-fonts RET to install the fonts
(require 'all-the-icons)

;; Folder explorer (file tree) Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle) ;; the F8 key toggles the file tree

;; Use doom theme for Emacs buffers
(setq custom-theme-directory "~/.emacs.d/themes")
(require 'doom-themes)
(load-theme 'doom-dracula t) ;; loads doom-one theme, there are other options:
			 ;; doom-vibrant, doom-molokai, doom-nova, and others
;; Use doom theme for Neotree file explorer
;;(doom-themes-neotree-config) ;; loads doom theme for the file tree Neotree
;;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
  ;;   doom-themes-enable-italic t) ; if nil, italics is universally disabled
;; Enable all-the-icons beautiful icons for the Neotree doom theme
;;(setq doom-neotree-enable-file-icons t)
;;(setq doom-neotree-enable-folder-icons t)
;;(setq doom-neotree-enable-chevron-icons t)
;; Enables different colors for different file types for the Neotree doom theme
;;(setq doom-neotree-enable-type-colors t)

;;(setq neo-theme (if (display-graphic-p) 'icons ))
(setq neo-window-fixed-size nil)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(defun neotree--fit-window (type path c)
  "Resize neotree window to fit contents based on TYPE, with PATH and C as unused variables as far as this function is concerned."
  (if (eq type 'directory)
      (neo-buffer--with-resizable-window
       (let ((fit-window-to-buffer-horizontally t))
         (fit-window-to-buffer)))))
(add-hook 'neo-enter-hook #'neotree--fit-window)


;;MODE LINE THEMES

(require 'doom-modeline)
(doom-modeline-init)

;; Smart-mode-line makes the mode-line better to read
;; first remove annoying message at startup that
;; asks if you want to run the theme lisp code
;;(setq sml/no-confirm-load-theme t)
;; load smart-mode-line
;;(setq sml/theme 'dark) ;; changes the theme to dark
;;(sml/setup) ;; automatically figures out a theme if none is specified

;;Electric mode
(electric-pair-mode 1)

;;Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (emmet-mode doom-themes neotree all-the-icons)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "mononoki" :foundry "nil" :slant normal :weight normal :height 181 :width normal)))))

;;GLOBAL LINE VERSIONS

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;;FONT FOR EMACS

(when (member "mononoki-Regular" (font-family-list))
  (set-frame-font "" t t))
