;; ------------------------ search path--------------------------
;; 
(add-to-list 'load-path "~/.emacs.d/")

;; ------------------------ accentuatin  --------------------------
;; 
(load-library "iso-transl")


;; ------------------------  Shortcut --------------------------
;; 
(global-set-key (kbd "M-<right>") 'next-multiframe-window)
(global-set-key (kbd "M-<left>") 'previous-multiframe-window)
(global-set-key (kbd "<f4>") 'kill-this-buffer)
(global-set-key (kbd "M-s") 'delete-trailing-whitespace)

;keys replacement
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<f5>") 'suspend-frame)



;; create an invisible backup directory and make the backups also invisable
(defun make-backup-file-name (filename)
(defvar backups-dir "./.emacs-backups/")
(make-directory backups-dir t)
(expand-file-name
(concat backups-dir "." (file-name-nondirectory filename) "~")
(file-name-directory filename)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Okular") (output-html "xdg-open"))))
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; ------------------------ Speedbar--------------------------
;; start speedbar only on X
(when window-system          ; start speedbar if we're using a window system

;; sppedbar on same window
 (defun sb-expand-curren-file ()
    "Expand current file in speedbar buffer"  
(interactive)                                                                                                                               
  (setq current-file (buffer-file-name))
  (sr-speedbar-refresh)
  (switch-to-buffer-other-frame "*SPEEDBAR*")
  (speedbar-find-selected-file current-file)
  (speedbar-expand-line))

;; speedbar directoryu tree relative to current buffer
  (speedbar t))
(defun nm-speedbar-expand-line-list (&optional arg)
  (when arg
    (message (car arg))
    (re-search-forward (concat " " (car arg) "$"))
    (speedbar-expand-line (car arg))
    (speedbar-next 1) ;; Move into the list.
    (nm-speedbar-expand-line-list (cdr arg))))

(defun nm-speedbar-open-current-buffer-in-tree ()
  (interactive)
  (let* ((root-dir (cdr (project-root-fetch)))
          (original-buffer-file-directory (file-name-directory (buffer-file-name)))
          (relative-buffer-path (car (cdr (split-string original-buffer-file-directory root-dir))))
          (parents (butlast (split-string relative-buffer-path "/"))))
    (save-excursion 
      (sr-speedbar-open) ;; <--- or whatever speedbar you have e.g. (speedbar 1)
      (set-buffer speedbar-buffer)
      (beginning-of-buffer)
      (nm-speedbar-expand-line-list parents))))

;;-----------------------------------------------------------
;; highlight continue after isearch
(setq lazy-highlight-cleanup nil)



;;-----------------------------------------------------------
;; font inconsolata
(set-default-font "Inconsolata 12")


;;-----------------------------------------------------------
;; 80 column rule
(add-to-list 'load-path "/home/rly/.emacs.d/column-enforce-mode/")

(load "column-enforce-mode")
(add-hook 'c-mode-hook 'column-enforce-mode)
