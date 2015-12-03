;;; -*- lexical-binding: t -*-
;;; fdoc2md.el -- Convert function documentation to markdown
(defvar fdoc-replacements
  '(("`\\([^']+\\)'" . "`\\1`"))
  "A list of alists where the car is the search regular
expression and the cdr is the replacement string.")

(defun fdoc2md (func file)
  "Extract the documentation from FUNC and try to convert it to
markdown then append it to FILE."
  (let ((doc (documentation func)))
    (mapc (lambda (re)
            (let ((start nil))
              (while (setq start (string-match (car re) doc
                                               (if start (match-end 0))))
                     (setq doc (replace-match (cdr re) nil nil doc nil)))))
            fdoc-replacements)
    (with-temp-buffer
      (insert doc)
      (insert "\n")
      (append-to-file (point-min) (point-max) file))))
