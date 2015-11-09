;; Tramp for SSH connections
;; Using TRAMP that comes with Emacs.
;; For installation of latest version go to http://www.gnu.org/software/tramp/#Installation
(require 'tramp)
(setq tramp-shell-prompt-pattern "(.*@domU.*)|(.*@oraclelinux6" )
(setq tramp-default-method "plink")

(server-start)
;; do not ask whether to kill a buffer when its client is still running
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(add-to-list 'load-path "~/emacs")
(add-to-list 'load-path "~/.emacs.d/")

;; Open files in existing emacs window
(setq ns-pop-up-frames nil)

;; Directory tree viewer for emacs
(require 'dirtree)

(load "prev-next-buffer")
(defun back-window ()
  (interactive)
  (other-window -1))

;; ErgoEmacs redoes all keybindings -- Danger
;; Turn off methods and mouse for running in a terminal
(if (not window-system)
    (defun tool-bar-mode(a) nil))
(if (not window-system)
    (setq mouse-wheel-mode nil))
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs_1.9.3.1/site-lisp/site-start.el")

;; Turn on mouse wheel for scrolling
(mouse-wheel-mode t)

;; Get rid of the Tab bar since I never use it
(tabbar-mode -1)
;; Get rid of tool bar and menu bar for more screen real estate
(menu-bar-mode -1)
(tool-bar-mode -1)

;; replace tabs with spaces
(setq-default indent-tabs-mode nil)

;; turn off 'file <foo> is large' messages
(setq large-file-warning-threshold nil)

;; Enable syntax highlighting for twiki pages (twiki.el package)
(load "twiki")
;;(require 'twiki)
(add-to-list 'auto-mode-alist'("\\.twiki$" . twiki-mode))

;; Don't turn off word wrap when splitting the window vertically
(setq truncate-partial-width-windows nil)

;; Autocomplete mode settings.
(setq ac-auto-start 3) ;; Start autocompletion after 3 characters were typed.
(setq ac-auto-show-menu 2.0) ;; Show auto-complete menu after 2 seconds.
(global-set-key (kbd "C-SPC") 'auto-complete)
(global-set-key (kbd "C-/") 'auto-complete)

;; My shortcuts
;; Remove Shift+Space binding from ErgoEmacs
(define-key xmsi-keymap (kbd "S-SPC") nil)
(global-set-key "\C-t" 'make-frame-command)
(global-set-key (kbd "C-S-t") 'delete-frame)
(global-set-key "\C-l" 'goto-line)
(global-set-key (kbd "C-S-O") 'find-alternate-file)
(global-set-key (kbd "M-@") 'previous-buffer)
(global-set-key (kbd "M-2") 'next-buffer)
(global-set-key (kbd "C-S-N") 'text-mode)
(global-set-key (kbd "C-S-M") 'auto-complete-mode)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-?") 'enlarge-window)
(global-set-key [M-f4] 'save-buffers-kill-emacs)
(global-set-key (kbd "C-B") 'iswitchb-buffer)
(global-set-key (kbd "C-S-B") 'ibuffer)
(global-set-key (kbd "M-,") 'pop-tag-mark)

;; Enable left/right keys in ibuffer
(defun iswitchb-local-keys ()
  (mapc (lambda (K)
          (let* ((key (car K)) (fun (cdr K)))
            (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
        '(("<right>" . iswitchb-next-match)
          ("<left>"  . iswitchb-prev-match)
          ("<up>"    . ignore             )
          ("<down>"  . ignore             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

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

;;; XEmacs backwards compatibility file
;(setq user-init-file
;      (expand-file-name "init.el"
;			(expand-file-name ".xemacs" "~")))
;(setq custom-file
;      (expand-file-name "custom.el"
;			(expand-file-name ".xemacs" "~")))

;(load-file user-init-file)
;(load-file custom-file)

;; ruby mode
;; setup files ending in ".rdl" to open in ruby-mode
(add-to-list 'auto-mode-alist '("\\.rdl\\'" . ruby-mode))

;; verilog mode
(setq verilog-indent-level              2
       verilog-indent-level-module      2
       verilog-indent-level-declaration 2
       verilog-indent-level-behavioral  2
       verilog-auto-newline nil)
(add-hook 'verilog-mode-hook
      '(lambda ()
         (setq indent-tabs-mode nil)
      ))

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

;; highlight-symbol package -- highlights all instances of a word
(require 'highlight-symbol)
(global-set-key [(shift f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;; Enable Verilog-Mode for Emacs -- colors and other junk for .v and .sv files
(defun prepend-path ( my-path ) 
(setq load-path (cons (expand-file-name my-path) load-path))) 
(defun append-path ( my-path ) 
(setq load-path (append load-path (list (expand-file-name my-path))))) 
;; Load verilog mode only when needed 
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t ) 
;; Any files that end in .v, .dv or .sv should be in verilog mode 
(add-to-list 'auto-mode-alist '("\\.[ds]?v[h]?\\'" . verilog-mode)) 
;; Any files in verilog mode should have their keywords colorized 
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1))) 

;; Set default font
;; (set-face-attribute
;;  'default nil :font
;;  "-adobe-courier-medium-r-normal--14-*-*-*-m-*-iso8859-1")
;; "-outline-Courier New-normal-normal-normal-mono-11-*-*-*-c-*-iso8859-1")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(visible-cursor t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(cursor ((t (:background "white"))))
 '(diredp-ignored-file-name ((t (:foreground "#bebebe"))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:background "black" :foreground "white")))))

;; Tweak show-paren-mode
(require 'paren)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold)
(set-face-attribute 'show-paren-match nil :background "gray10")
