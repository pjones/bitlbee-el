;;; -*- lexical-binding: t -*-
;;; pkgtest.el -- Install a test package into a clean Emacs
(require 'package)

(defun elpkg-test-package (tarball)
  "Load the given tarball into a fake package store."
  (let ((package-user-dir (concat (file-name-sans-extension tarball) ".elpa"))
        (package-archives
         '(("gnu"       . "http://elpa.gnu.org/packages/")
           ("marmalade" . "http://marmalade-repo.org/packages/"))))
    (toggle-debug-on-error)
    (package-initialize)
    (package-install-file tarball)
    ;; TODO: check for tests and run:
    ;; (ert-run-tests-batch-and-exit)
    ))
