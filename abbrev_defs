;;-*-coding: utf-8;-*-
(define-abbrev-table 'Buffer-menu-mode-abbrev-table '())

(define-abbrev-table 'Info-edit-mode-abbrev-table '())

(define-abbrev-table 'awk-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'bmkp-edit-bookmark-record-mode-abbrev-table '())

(define-abbrev-table 'bookmark-bmenu-mode-abbrev-table '())

(define-abbrev-table 'bookmark-edit-annotation-mode-abbrev-table '())

(define-abbrev-table 'c++-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'c-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'comint-mode-abbrev-table '())

(define-abbrev-table 'completion-list-mode-abbrev-table '())

(define-abbrev-table 'conf-colon-mode-abbrev-table '())

(define-abbrev-table 'conf-javaprop-mode-abbrev-table '())

(define-abbrev-table 'conf-ppd-mode-abbrev-table '())

(define-abbrev-table 'conf-space-mode-abbrev-table '())

(define-abbrev-table 'conf-unix-mode-abbrev-table '())

(define-abbrev-table 'conf-windows-mode-abbrev-table '())

(define-abbrev-table 'conf-xdefaults-mode-abbrev-table '())

(define-abbrev-table 'cperl-mode-abbrev-table
  '(
    ("=head1" "=head1" cperl-electric-pod 0)
    ("=head2" "=head2" cperl-electric-pod 0)
    ("=over" "=over" cperl-electric-pod 0)
    ("=pod" "=pod" cperl-electric-pod 0)
    ("continue" "continue" cperl-electric-else 0)
    ("do" "do" cperl-electric-keyword 0)
    ("else" "else" cperl-electric-else 0)
    ("elsif" "elsif" cperl-electric-keyword 0)
    ("for" "for" cperl-electric-keyword 0)
    ("foreach" "foreach" cperl-electric-keyword 0)
    ("foreachmy" "foreachmy" cperl-electric-keyword 0)
    ("formy" "formy" cperl-electric-keyword 0)
    ("head1" "head1" cperl-electric-pod 0)
    ("head2" "head2" cperl-electric-pod 0)
    ("if" "if" cperl-electric-keyword 0)
    ("over" "over" cperl-electric-pod 0)
    ("pod" "pod" cperl-electric-pod 0)
    ("unless" "unless" cperl-electric-keyword 0)
    ("until" "until" cperl-electric-keyword 0)
    ("while" "while" cperl-electric-keyword 0)
   ))

(define-abbrev-table 'diredp-w32-drives-mode-abbrev-table '())

(define-abbrev-table 'dirtree-mode-abbrev-table '())

(define-abbrev-table 'edit-abbrevs-mode-abbrev-table '())

(define-abbrev-table 'elisp-byte-code-mode-abbrev-table '())

(define-abbrev-table 'emacs-lisp-mode-abbrev-table '())

(define-abbrev-table 'fundamental-mode-abbrev-table '())

(define-abbrev-table 'global-abbrev-table '())

(define-abbrev-table 'groovy-mode-abbrev-table '())

(define-abbrev-table 'help-mode-abbrev-table '())

(define-abbrev-table 'html-mode-abbrev-table '())

(define-abbrev-table 'idl-mode-abbrev-table '())

(define-abbrev-table 'inferior-python-mode-abbrev-table '())

(define-abbrev-table 'java-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'js-jsx-mode-abbrev-table '())

(define-abbrev-table 'js-mode-abbrev-table '())

(define-abbrev-table 'lisp-mode-abbrev-table
  '(
    ("8d" "defun" nil 0)
    ("8i" "insert" nil 0)
    ("8l" "let" nil 0)
    ("8m" "message" nil 0)
    ("8p" "point" nil 0)
    ("8s" "setq" nil 0)
    ("8v" "vector" nil 0)
    ("8w" "when" nil 0)
    ("ah" "add-hook" nil 0)
    ("bc" "backward-char" nil 0)
    ("bfn" "buffer-file-name" nil 0)
    ("bmp" "buffer-modified-p" nil 0)
    ("bol" "beginning-of-line" nil 0)
    ("botap" "bounds-of-thing-at-point" nil 0)
    ("bs" "buffer-substring" nil 0)
    ("bsnp" "buffer-substring-no-properties" nil 0)
    ("ca" "custom-autoload" nil 0)
    ("cb" "current-buffer" nil 0)
    ("cc" "condition-case" nil 0)
    ("cd" "copy-directory" nil 0)
    ("cdr" "cdr" nil 0)
    ("cf" "copy-file" nil 0)
    ("dc" "delete-char" nil 0)
    ("dd" "delete-directory" nil 0)
    ("df" "delete-file" nil 0)
    ("dk" "define-key" nil 0)
    ("dr" "delete-region" nil 0)
    ("efn" "expand-file-name" nil 0)
    ("eol" "end-of-line" nil 0)
    ("fc" "forward-char" nil 0)
    ("ff" "find-file" nil 0)
    ("fl" "forward-line" nil 0)
    ("fnd" "file-name-directory" nil 0)
    ("fne" "file-name-extension" nil 0)
    ("fnn" "file-name-nondirectory" nil 0)
    ("fnse" "file-name-sans-extension" nil 0)
    ("frn" "file-relative-name" nil 0)
    ("gc" "goto-char" nil 0)
    ("gnb" "generate-new-buffer" nil 0)
    ("gsk" "global-set-key" nil 0)
    ("ifc" "insert-file-contents" nil 0)
    ("kb" "kill-buffer" nil 0)
    ("la" "looking-at" nil 0)
    ("lbp" "line-beginning-position" nil 0)
    ("lep" "line-end-position" nil 0)
    ("mb" "match-beginning" nil 0)
    ("md" "make-directory" nil 0)
    ("me" "match-end" nil 0)
    ("mlv" "make-local-variable" nil 0)
    ("ms" "match-string" nil 0)
    ("nts" "number-to-string" nil 0)
    ("pm" "point-min" nil 0)
    ("rap" "region-active-p" nil 0)
    ("rb" "region-beginning" nil 0)
    ("re" "region-end" nil 0)
    ("rf" "rename-file" nil 0)
    ("rq" "regexp-quote" nil 0)
    ("rr" "replace-regexp" nil 0)
    ("rris" "replace-regexp-in-string" nil 0)
    ("rsb" "re-search-backward" nil 0)
    ("rsf" "re-search-forward" nil 0)
    ("sb" "set-buffer" nil 0)
    ("sbr" "search-backward-regexp" nil 0)
    ("sc" "shell-command" nil 0)
    ("scb" "skip-chars-backward" nil 0)
    ("scf" "skip-chars-forward" nil 0)
    ("se" "save-excursion" nil 0)
    ("sf" "search-forward" nil 0)
    ("sfm" "set-file-modes" nil 0)
    ("sfr" "search-forward-regexp" nil 0)
    ("sm" "string-match" nil 0)
    ("ss" "split-string" nil 0)
    ("stn" "string-to-number" nil 0)
    ("str" "string" nil 0)
    ("tap" "thing-at-point" nil 0)
    ("wcb" "with-current-buffer" nil 0)
    ("wg" "widget-get" nil 0)
    ("yonp" "yes-or-no-p" nil 0)
   ))

(define-abbrev-table 'makefile-automake-mode-abbrev-table '())

(define-abbrev-table 'makefile-bsdmake-mode-abbrev-table '())

(define-abbrev-table 'makefile-gmake-mode-abbrev-table '())

(define-abbrev-table 'makefile-imake-mode-abbrev-table '())

(define-abbrev-table 'makefile-makepp-mode-abbrev-table '())

(define-abbrev-table 'makefile-mode-abbrev-table '())

(define-abbrev-table 'messages-buffer-mode-abbrev-table '())

(define-abbrev-table 'nxml-mode-abbrev-table '())

(define-abbrev-table 'objc-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'occur-edit-mode-abbrev-table '())

(define-abbrev-table 'occur-mode-abbrev-table '())

(define-abbrev-table 'package-menu-mode-abbrev-table '())

(define-abbrev-table 'perl-mode-abbrev-table '())

(define-abbrev-table 'pike-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'process-menu-mode-abbrev-table '())

(define-abbrev-table 'prog-mode-abbrev-table '())

(define-abbrev-table 'python-mode-abbrev-table
  '(
    ("class" "" python-skeleton-class 0)
    ("def" "" python-skeleton-def 0)
    ("for" "" python-skeleton-for 0)
    ("if" "" python-skeleton-if 0)
    ("try" "" python-skeleton-try 0)
    ("while" "" python-skeleton-while 0)
   ))

(define-abbrev-table 'ruby-mode-abbrev-table '())

(define-abbrev-table 'sgml-mode-abbrev-table '())

(define-abbrev-table 'sh-mode-abbrev-table '())

(define-abbrev-table 'shell-mode-abbrev-table '())

(define-abbrev-table 'snippet-mode-abbrev-table '())

(define-abbrev-table 'special-mode-abbrev-table '())

(define-abbrev-table 'tabulated-list-mode-abbrev-table '())

(define-abbrev-table 'text-mode-abbrev-table '())

(define-abbrev-table 'tree-mode-abbrev-table '())

(define-abbrev-table 'verilog-mode-abbrev-table
  '(
   ))

(define-abbrev-table 'yaml-mode-abbrev-table '())

