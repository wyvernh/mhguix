#!/usr/bin/env -S guix repl --
!#
;; Usage: sudo mhdisk /path/to/system/hostname.scm

(define-module (wyvernh scripts run-mhdisk))

(apply (@ (wyvernh scripts mhdisk) main) (list (command-line)))
