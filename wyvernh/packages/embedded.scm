(define-module (wyvernh packages embedded)
  #:use-module (guix packages)
  #:use-module (guix git)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix licenses)
  #:use-module (guix build-system cmake))

(define-public picotool
  (package
   (name "picotool")
   (version "2.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/raspberrypi/picotool.git")
           (commit "df21059f7ca6f1babc7f1f3b92122cacffc85951")))
     (sha256
      (base32
       "197ckhcwy5psv29i9aw2fx4alvc7jn8jirhnvqzsm5yxvzbn2s38"))))
   (build-system cmake-build-system)
   (arguments
    (list
     #:phases
     #~(modify-phases %standard-phases
                      (add-before 'configure 'add-pico-path
                                  (lambda _
                                    (setenv "PICO_SDK_PATH" "/home/matthew/src/pico-sdk"))))))
   (native-inputs
    (list ))
   (inputs (list ))
   (synopsis "Raspberry Pi's picotool")
   (description "not really sure exactly what this does but it's important")
   (home-page "https://github.com/raspberrypi/picotool/blob/master/README.md")
   (license expat)))

picotool
