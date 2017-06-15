;;;; Server/client
;;(stp-server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("86544bb733ee8c94f191e7a30b30dcb826616f1eaecc3b1f3e614d06f3eff1fa" default)))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; highlight parenthesis
(show-paren-mode)
;; and make them pretty
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; line numbering always displayed
(require 'linum)
(require 'package)
(global-linum-mode 1)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 
;; C + n gives newline if mark is at end of buffer
(setq next-line-add-newlines t)
;; no more yes or no
(fset 'yes-or-no-p 'y-or-n-p)
;; disable splash screen
(setq inhibit-splash-screen t)
;; set default size and placement of the emacs window
(setq default-frame-alist '( (left . 0) (top . 0) (height . 45) (width . 80) ))
;; use 'C-ö' and 'M-ö' instead of backspace
(global-set-key (kbd "C-ä") 'delete-backward-char)
(global-set-key (kbd "M-ä") 'backward-kill-word)
;; just because I like that simple feel
(set-frame-font "DejaVu Sans Mono-10" nil t)
;; multiple cursors, what's not to love?
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; hungry-delete to get rid of all those pesky whitespaces
(require 'hungry-delete)
(add-hook 'Python-mode-hook #'(lambda () (hungry-keyboard Python-mode-map)))
(add-hook 'Shell-script-mode-hook #'(lambda () (hungry-keyboard Shell-script-mode-map)))
;; readable undo-tree
(require 'undo-tree)
