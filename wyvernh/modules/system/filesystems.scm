(define-module (wyvernh modules system filesystems)
  #:export (system-filesystems))

;; fs-XXX will be different constructors for a filesystem object that will contain 'type' and 'size' and 'fs' which contains a usual guix filesystem object. Then the filesystems-from procedure will take a list of filesystem objects and return a list of guix file-systems.

(lambda size)

(lambda filesystem-with-properties %MP %LABEL %TYPE
  ;;return (file-system (mount-point %MP) (device (file-system-label %LABEL) %TYPE
  )

(lambda fs-efi)

(lambda fs-root)

(lambda fs-gnu)

(lambda fs-swap)

(lambda fs-home)

(lambda fs-other)

(lambda system-filesystems)
