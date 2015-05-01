;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

;;; Common Setting
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Meta key
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Line spacing
;;(setq-default line-spacing 0.2)

;; open *help* in current frame
(setq special-display-regexps (remove "[ ]?\\*[hH]elp.*" special-display-regexps))

;; Turn off mouse interface early in startup to avoid momentary display
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Write backup files to one directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Save point position
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Diminish modeline clutter
(require 'diminish)
;;(diminish 'wrap-region-mode)

;;; Elip go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (elisp-slime-nav-mode t)))
(eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

;; goto-line-with-feedback
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback()
  "Show line temporarily, while promting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; Auto refresh buffers
;;(global-auto-revert-mode 1)
;; Also auto refresh dired, but bi quiet about it
;;(setq global-auto-revert-non-file-buffers t)
;;(setq auto-revert-verbose nil)

;;; Type Punctuations Easily
(define-key key-translation-map (kbd "C-5") (kbd "\\"))
(define-key key-translation-map (kbd "C-6") (kbd "|"))
(define-key key-translation-map (kbd "C-7") (kbd "}"))
(define-key key-translation-map (kbd "C-8") (kbd "{"))
(define-key key-translation-map (kbd "C-9") (kbd "["))
(define-key key-translation-map (kbd "C-0") (kbd "]"))
(define-key key-translation-map (kbd "C--") (kbd "="))
(define-key key-translation-map (kbd "C-,") (kbd "+"))
(define-key key-translation-map (kbd "C-'") (kbd "~"))

;;; General Keybinding
(define-key key-translation-map [?\C-h] [?\C-?])
(define-key key-translation-map [?\C-?] [?\C-h])
(defun kill-region-or-backward-kill-word (&optional arg region)
  "`kill-region' if the region is active, otherwise `backward-kill-word'"
  (interactive
   (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)
(global-set-key (kbd "M-j")
		(lambda ()
                  (interactive)
                  (join-line -1)))

(keyboard-translate ?\C-t ?\C-x)
(keyboard-translate ?\C-x ?\C-t)
(global-set-key (kbd "M-t") 'execute-extended-command)
(global-set-key (kbd "M-o") 'switch-window)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'C++-mode 'java-mode 'asm-mode)
	      (ggtags-mode 1))))

(global-set-key (kbd "RET") 'newline-and-indent)

(require 'helm-config)
(helm-mode 1)
