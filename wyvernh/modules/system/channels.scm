(define-module (wyvernh modules system channels)
  #:use-module (guix channels))

(define-public %wyvernh-base-channels
  (list (channel
         (name 'mhguix)
         (url "https://github.com/wyvernh/mhguix")
         (branch "master")
         (commit
          "02d09da886abb14a37b7025616d752ff1e184f62"))
        (channel
         (name 'nonguix)
         (url "https://gitlab.com/nonguix/nonguix")
         (branch "master")
         (commit
          "df4e6ed9fe917f004357d931e210e328e348bb38")
         (introduction
          (make-channel-introduction
           "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
           (openpgp-fingerprint
            "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
        (channel
         (name 'guix)
         (url "https://git.guix.gnu.org/guix.git")
         (branch "master")
         (commit
          "94ec8623a86e49beb0f80415a1fc194b8498dc9a")
         (introduction
          (make-channel-introduction
           "9edb3f66fd807b096b48283debdcddccfea34bad"
           (openpgp-fingerprint
            "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))))

(define-public %wyvernh-channels
  (list (channel
         (name 'guix-science-nonfree)
         (url "https://codeberg.org/guix-science/guix-science-nonfree.git")
         (branch "master")
         (commit
          "d87f5c1b09f287f798268751e2d14f8c2b3453da")
         (introduction
          (make-channel-introduction
           "58661b110325fd5d9b40e6f0177cc486a615817e"
           (openpgp-fingerprint
            "CA4F 8CF4 37D7 478F DA05  5FD4 4213 7701 1A37 8446"))))
        (channel
         (name 'guix-science)
         (url "https://codeberg.org/guix-science/guix-science.git")
         (branch "master")
         (commit
          "d65eb0f1f8e65f9d5e34b4f14e5573a793d8d07e")
         (introduction
          (make-channel-introduction
           "b1fe5aaff3ab48e798a4cce02f0212bc91f423dc"
           (openpgp-fingerprint
            "CA4F 8CF4 37D7 478F DA05  5FD4 4213 7701 1A37 8446"))))
        (channel
         (name 'guix-past)
         (url "https://codeberg.org/guix-science/guix-past.git")
         (branch "master")
         (commit
          "b14d7f997ae8eec788a7c16a7252460cba3aaef8")
         (introduction
          (make-channel-introduction
           "0c119db2ea86a389769f4d2b9c6f5c41c027e336"
           (openpgp-fingerprint
            "3CE4 6455 8A84 FDC6 9DB4  0CFB 090B 1199 3D9A EBB5"))))))
