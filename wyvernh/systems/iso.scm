(define-module (wyvernh systems iso)
    #:use-module (wyvernh modules home)
    #:use-module (wyvernh modules system)
    #:use-module (gnu bootloader)
    #:use-module (gnu bootloader grub)
    #:use-module (gnu tests)
    #:use-module (gnu image)
    #:use-module (gnu system)
    #:use-module (gnu system image)
    #:use-module (gnu system install)
    #:use-module (gnu system linux-initrd)
    #:use-module (guix gexp)
    #:re-export (os))

  (system-config
                                          ;#:filesystems '((fs-efi #:size (* 40 MiB) #:label "ISO_ESP")
                                          ;                (fs-root #:size 'guess #:label "ISO_Root" #:type "ext4"))
   #:filesystems '((fs-root #:size 'guess #:type "iso9660" #:label "GUIX_IMAGE"))
   #:users '((basic-user "iso"))
   #:groups '()
   #:packages '(core)
   #:services '(autologin substitutes network-manager))

  (define iso-os
    (operating-system
     (inherit %simple-os)
     (packages (operating-system-packages os))
     (services (operating-system-user-services os))))

  (define MiB (expt 2 20))

  (image
   (format 'disk-image)
   (operating-system iso-os)
   (partitions
    (list
     (partition
      (size (* 40 MiB))
      (offset (* 1024 1024))
      (label "GNU-ESP")
      (file-system "vfat")
      (flags '(esp))
      (initializer (gexp initialize-efi-partition)))
     (partition
      (size (* 50 MiB))
      (label "DATA")
      (file-system "ext4")
      (initializer #~(lambda* (root . rest)
                              (mkdir root)
                              (call-with-output-file
                                  (string-append root "/data")
                                (lambda (port)
                                  (format port "my-data"))))))
     (partition
      (size 'guess)
      (label root-label)
      (file-system "ext4")
      (flags '(boot))
      (initializer (gexp initialize-root-partition))))))

;;(os->image iso-os #:type iso-image-type)
