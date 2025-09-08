(define-module (wyvernh modules system filesystems)
  #:use-module (wyvernh modules tools)
  #:use-module (gnu)
  #:export (filesystems-from swap-devices-from disk-from))

(define (no-fs size type label has-swap)
  `((size . ,size) (type . ,type) (label . ,label) (swap . ,has-swap)))

(define (simple-fs mount-point size type label)
  (cons
   `(fs ,(file-system
          (mount-point mount-point)
          (type type)
          (device (file-system-label label))))
   (no-fs size type label #f)))

(define* (fs-efi #:key (size "500M") (type "vfat") (label "EFI SYSTEM"))
  (simple-fs "/efi" size type label))

(define* (fs-root #:key (size "100G") (type "ext4") (label "Guix"))
  (simple-fs "/" size type label))

(define* (fs-gnu #:key (size "100G") (type "ext4") (label "GNU"))
  (simple-fs "/gnu" size type label))

(define* (fs-swap #:key (size "18G") (type "linux-swap") (label "Swap"))
  (no-fs size type label #t))

(define* (fs-home #:key (size "*") (type "ext4") (label "HOME"))
  (simple-fs "/home" size type label))

(define* (fs-other #:key size (label "") (type "ext4") (swap #f))
  (no-fs size type label swap))

(define current-env (interaction-environment))

(define (disk-from lst)
  (eval-map lst current-env))

(define (gnu-fs-from alist)
  (assoc-ref alist 'fs))

(define (filesystems-from lst)
  (append (remove-false (map gnu-fs-from (disk-from lst))) %base-file-systems))

(define (gnu-sd-from alist mapped-devices)
  (if (assoc-ref alist 'swap)
      (swap-space
       (target (file-system-label (assoc-ref alist 'label)))
       (dependencies mapped-devices))
      #f))

(define (swap-devices-from lst mapped-devices)
  (remove-false (map (lambda (alist) (gnu-sd-from alist mapped-devices)) (disk-from lst))))
