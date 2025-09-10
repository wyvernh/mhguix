(define-module (wyvernh modules system filesystems)
  #:use-module (wyvernh modules tools)
  #:use-module (gnu)
  #:use-module (gnu image)
  #:export (filesystems-from swap-devices-from disk-from))

(define (no-fs size type label has-swap)
  (list (cons 'size size)
        (cons 'type type)
        (cons 'label label)
        (cons 'swap has-swap)))

(define (simple-fs mount-point size type label)
  (acons 'fs
         (file-system
          (mount-point mount-point)
          (type type)
          (device (file-system-label label)))
         (no-fs size type label #f)))

(define KiB (expt 2 10))
(define MiB (expt 2 20))
(define GiB (expt 2 30))

(define* (fs-efi #:key (size (* 500 MiB)) (type "vfat") (label "EFI SYSTEM"))
  (simple-fs "/efi" size type label))

(define* (fs-root #:key (size (*100 GiB)) (type "ext4") (label "Guix"))
  (simple-fs "/" size type label))

(define* (fs-gnu #:key (size (* 100 GiB)) (type "ext4") (label "GNU"))
  (simple-fs "/gnu" size type label))

(define* (fs-swap #:key (size (* 18 GiB)) (type "linux-swap") (label "Swap"))
  (no-fs size type label #t))

(define* (fs-home #:key (size 'guess) (type "ext4") (label "HOME"))
  (simple-fs "/home" size type label))

(define* (fs-other #:key size (label #f) (type "ext4") (swap #f))
  (no-fs size type label swap))

(define current-env (interaction-environment))

(define (fs-list-from lst)
  (eval-map lst current-env))

(define (gnu-fs-from alist)
  (assoc-ref alist 'fs))

(define (filesystems-from lst)
  (append (remove-false (map gnu-fs-from (fs-list-from lst))) %base-file-systems))

(define (gnu-sd-from alist mapped-devices)
  (if (assoc-ref alist 'swap)
      (swap-space
       (target (file-system-label (assoc-ref alist 'label)))
       (dependencies mapped-devices))
      #f))

(define (swap-devices-from lst mapped-devices)
  (remove-false
   (map (lambda (alist) (gnu-sd-from alist mapped-devices))
        (fs-list-from lst))))

(define (disk-from lst)
  (map (lambda (alist) (partition
                   (size (assoc-ref alist 'size))
                   (label (assoc-ref alist 'label))
                   (file-system (assoc-ref alist 'type))))
       (fs-list-from lst)))
