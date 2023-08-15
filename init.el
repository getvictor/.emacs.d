;; Package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Keeping configs clean. Load as early as possible.
(require 'no-littering)

(add-to-list 'load-path "~/.emacs.d/packages")

;; Tramp for SSH connections
;; Using TRAMP that comes with Emacs.
;; For installation of latest version go to http://www.gnu.org/software/tramp/#Installation
(require 'tramp)
(setq tramp-shell-prompt-pattern "(.*@domU.*)|(.*@oraclelinux6" )
(setq tramp-default-method "plink")
(customize-set-variable 'tramp-encoding-shell "/tool/pandora64/bin/tcsh")

(server-start)
;; do not ask whether to kill a buffer when its client is still running
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; Open files in existing emacs window
(setq ns-pop-up-frames nil)

;; Turn off methods and mouse for running in a terminal
(if (not window-system)
    (defun tool-bar-mode(a) nil))
(if (not window-system)
    (setq mouse-wheel-mode nil))

;; Turn on mouse wheel for scrolling
(mouse-wheel-mode t)

;; Get rid of tool bar and menu bar for more screen real estate
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Mac settings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; replace tabs with spaces
(setq-default indent-tabs-mode nil)

;; turn off 'file <foo> is large' messages
(setq large-file-warning-threshold nil)

;; Don't turn off word wrap when splitting the window vertically
(setq truncate-partial-width-windows nil)

;; Autocomplete mode settings.
(setq ac-auto-start nil) ;; Start autocompletion after 3 characters were typed.
(setq ac-auto-show-menu 2.0) ;; Show auto-complete menu after 2 seconds.
(global-set-key (kbd "C-SPC") 'auto-complete)
(global-set-key (kbd "C-/") 'auto-complete)

;; My shortcuts
;; Remove problematic key bindings in other modes
(eval-after-load "mhtml-mode"
  '(define-key mhtml-mode-map (kbd "M-o") nil)) ;; HTML+ mode
;; Emacs-specific keys
(global-set-key (kbd "M-a") 'execute-extended-command)
;; Navigation
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-j") 'left-char)
(global-set-key (kbd "M-l") 'right-char)
(global-set-key (kbd "M-h") 'move-beginning-of-line)
(global-set-key (kbd "M-H") 'move-end-of-line)
(global-set-key (kbd "M-o") 'forward-word)
(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-U") 'backward-paragraph)
(global-set-key (kbd "M-O") 'forward-paragraph)
(global-set-key (kbd "M-I") 'scroll-down-command)
(global-set-key (kbd "M-K") 'scroll-up-command)
(global-set-key (kbd "M-J") 'beginning-of-buffer)
(global-set-key (kbd "M-L") 'end-of-buffer)
(global-set-key "\C-l" 'goto-line)

;; Editing
(global-set-key (kbd "M-f") 'delete-forward-char)
(global-set-key (kbd "M-F") 'delete-backward-char)
(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-r") 'kill-word) ;; delete next word
(global-set-key (kbd "M-e") 'backward-kill-word)
(global-set-key (kbd "M-g") 'kill-line) ;; delete to end of line
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "M-G") 'backward-kill-line)
(whole-line-or-region-global-mode 1) ;; mode that allows cut/copy/etc. to both work on a line or on a highlighted region
(global-set-key (kbd "M-x") 'kill-region) ;; cut
(global-set-key (kbd "M-c") 'kill-ring-save) ;; copy
(global-set-key (kbd "M-v") 'yank) ;; paste
(global-set-key (kbd "C-v") 'yank) ;; paste
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-z") 'undo)
;; NOTE: There is no redo. Just do something else and then undo to achieve the same effect.
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; Search
(global-set-key (kbd "M-;") 'isearch-forward)
(define-key isearch-mode-map (kbd "M-;") 'isearch-repeat-forward)
(global-set-key (kbd "M-:") 'isearch-backward)
(define-key isearch-mode-map (kbd "M-:") 'isearch-repeat-backward)
(global-set-key (kbd "M-5") 'replace-string)
(global-set-key (kbd "M-%") 'replace-regexp)

;; Buffers and Windows
(global-set-key (kbd "C-s") 'save-buffer)
(defun back-window ()
  (interactive)
  (other-window -1))
(global-set-key (kbd "M-S") 'back-window)
(global-set-key (kbd "M-s") 'other-window)
(global-set-key (kbd "C-B") 'ibuffer)
(global-set-key (kbd "C-b") 'switch-to-buffer)
(global-set-key (kbd "M-@") 'previous-buffer)
(global-set-key (kbd "M-2") 'next-buffer)
(global-set-key (kbd "C-S-o") 'find-alternate-file)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "M-4") 'split-window-below)
(global-set-key (kbd "M-$") 'split-window-right)
(global-set-key (kbd "M-3") 'delete-other-windows)
(global-set-key (kbd "C-W") 'kill-this-buffer)

(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(global-set-key (kbd "C-;") 'vi-open-line-below)
(global-set-key (kbd "C-:") 'vi-open-line-above)

(defun javadoc-comment-above ()
  ;; Insert a generic javadoc comment above the current line.
  (interactive)
  (vi-open-line-above)
  (insert "/**")
  (vi-open-line-below)
  (insert "* ")
  (vi-open-line-below)
  (insert "*/")  
  (previous-line 1)
  (end-of-line)
  (insert " "))
(global-set-key (kbd "M-\"") 'javadoc-comment-above)

;; Colors
(set-face-foreground 'default "LightBlue")
(set-face-background 'default "black")
; Set mouse color to white
(set-mouse-color "white")

;; Makefile mode
(add-to-list 'auto-mode-alist '("\\.make\\'" . makefile-mode))

;; ruby mode
;; setup files ending in ".rdl" to open in ruby-mode
(add-to-list 'auto-mode-alist '("\\.rdl\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.dj\\'" . ruby-mode))

;; yaml mode
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; verilog mode
(setq verilog-auto-endcomments nil)
(setq verilog-indent-level              2
       verilog-indent-level-module      2
       verilog-indent-level-declaration 2
       verilog-indent-level-behavioral  2
       verilog-auto-newline nil)
(add-hook 'verilog-mode-hook
      '(lambda ()
         (setq indent-tabs-mode nil)
      ))
;; Any files that end in .v, .dv or .sv should be in verilog mode 
(add-to-list 'auto-mode-alist '("\\.[ds]?v[h]?\\'" . verilog-mode)) 
;; Any files in verilog mode should have their keywords colorized 
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1))) 

;; cPerl mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(setq cperl-invalid-face nil)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 0)
(setq cperl-extra-newline-before-brace t)

;; Kotlin.
(add-to-list 'auto-mode-alist '("\\.kt$" . kotlin-mode))

;; enable font lock mode
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)        ; GNU Emacs
  (setq font-lock-auto-fontify t))   ; XEmacs

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'highlight "#333")
;; Make Text mode the default so that highlight line mode will work for all files
(setq default-major-mode 'text-mode)
;; Tweak text mode not to create a newline when saving a file
(add-hook 'text-mode-hook 
	  '(lambda ()
	     (setq require-final-newline nil)
	     (setq mode-require-final-newline nil)))

;; Enable AutoCompression Mode so that I can see *.gz files without problems
(auto-compression-mode 1)

;; Highlight symbols with overlays while providing a keymap for various operations about highlighted symbols.
(require 'symbol-overlay)
(global-set-key (kbd "<f11>") 'symbol-overlay-put)
(global-set-key (kbd "<f12>") 'symbol-overlay-jump-next)
(global-set-key (kbd "<f10>") 'symbol-overlay-jump-prev)
;;(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
;;(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)

(setq-default cursor-type 'bar)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(whole-line-or-region verilog-mode no-littering yaml-mode auto-complete python-mode kotlin-mode ergoemacs-mode gnu-elpa-keyring-update))
 '(visible-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(cursor ((t (:background "white"))))
 '(diredp-ignored-file-name ((t (:foreground "#bebebe"))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:background "black" :foreground "white"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))

;; Tweak show-paren-mode
(require 'paren)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold)
(set-face-attribute 'show-paren-match nil :background "gray10")
(set-face-attribute 'show-paren-match nil :foreground "gold")
