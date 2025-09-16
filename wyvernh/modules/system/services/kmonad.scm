(define-module (wyvernh modules system services kmonad)
  #:use-module (wyvernh packages configuration)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:export (kmonad-service-type
            kmonad-configuration
            make-kmonad-configuration
            kmonad-configuration?
            kmonad-configuration-hostname))

(define-record-type* <kmonad-configuration>
  kmonad-configuration
  make-kmonad-configuration
  kmonad-configuration?
  (hostname kmonad-configuration-hostname
            (default "default")))

(define kmonad-service-type
  (service-type
   (name 'kmonad)
   (extensions
    (list
     (service-extension
      shepherd-root-service-type
      (lambda (config)
        (let ((hostname (kmonad-configuration-hostname config)))
          (list
           (shepherd-service
            (provision '(kmonad))
            (requirement '(udev user-processes))
            (start #~(make-forkexec-constructor
                      (list #$(file-append kmonad "/bin/kmonad")
                            #$(file-append kmonad-config
                                           (string-append "/share/kmonad/" hostname ".kbd")))))
            (stop #~(make-kill-destructor))
            (documentation
             "Run kmonad with a custom configuration.")))
          '())))
     (service-extension
      profile-service-type
      (lambda (config)
        (list kmonad kmonad-config)))))
   (description
    "Run the kmonad keyboard remapper with a specific configuration
package and input device.")
   (default-value (kmonad-configuration (hostname "default")))))
