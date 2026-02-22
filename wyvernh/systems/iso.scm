(define-module (wyvernh systems iso)
  #:use-module (wyvernh modules home)
  #:use-module (wyvernh modules system)
  #:use-module (gnu image)
  #:use-module (gnu system image)
  ;#:use-module (guix gexp)
  #:re-export (os))

(system-config
 ;#:filesystems '((fs-efi #:size (* 40 MiB) #:label "ISO_ESP")
 ;                (fs-root #:size 'guess #:label "ISO_Root" #:type "ext4"))
 #:filesystems '((fs-root #:size 'guess #:type "iso9660" #:label "GUIX_IMAGE"))
 #:users '((basic-user "iso"))
 #:groups '()
 #:packages '(core installer)
 #:services '(autologin substitutes network-manager))

(os->image os #:type iso-image-type)

;(image
; (inherit efi-disk-image)
; (operating-system os)
; (partitions
;  (list (partition
;         (inherit esp-partition)
;         (label "ISO_ESP"))
;        (partition
;         (size (* 50 (expt 2 20)))
;         (label "ISO_Data")
;         (file-system "ext4")
;         (initializer
;          #~(lambda* (root . rest)
;                     (mkdir root)
;                     (call-with-output-file
;                         (string-append root "/data")
;                       (lambda (port)
;                         (format port "my-data"))))))
;        (partition
;         (inherit root-partition)
;         (label "ISO_Root")))))
