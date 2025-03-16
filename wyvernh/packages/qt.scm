(define-module (wyvernh packages qt)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake))



(define-public qtgraphs
  (package
   (name "qtgraphs")
   (version "6.7.2")
   (source (origin
            (method url-fetch)
            (uri "https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtgraphs-everywhere-src-6.7.2.tar.xz")
            (sha256
             (base32
              "0046293800if5ca04r40wsa4gxh8r5q6c863yrx3cmjadqk3m0fq"))))
   (build-system cmake-build-system)
   (arguments
    (list
     #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
     #:phases
     #~(modify-phases %standard-phases
                      (add-after 'install 'delete-installed-tests
                                 (lambda _
                                   (delete-file-recursively (string-append #$output "/tests"))))
                      (delete 'check)
                      (add-after 'install 'check
                                 (assoc-ref %standard-phases 'check))
                      (add-before 'check 'check-setup
                                  (lambda _
                                    (setenv "QT_QPA_PLATFORM" "offscreen")
                                    (setenv "QML_IMPORT_PATH"
                                            (string-append #$output "/lib/qt6/qml:"
                                                           (getenv "QML_IMPORT_PATH"))))))))
   (native-inputs
    (list perl pkg-config qtdeclarative))
   (inputs (list libxkbcommon qtbase))
   (synopsis "Qt Graphs module")
   (description "The Qt Graphs module enables you to visualize data in 2D and 3D graphs.  In the 3D realm there is support for bar, scatter, and surface graphs. It's especially useful for visualizing depth maps and large quantities of rapidly changing data, such as data received from multiple sensors. The look and feel of graphs can be customized by using themes or by adding custom items and labels.  In the 2D realm, there is support for area, bar, donut, line, pie, scatter, and spline graphs, and they are easily combinable with any other QML content.  Qt Graphs is built on Qt 6 and the 3D graphs on Qt Quick 3D to take advantage of hardware acceleration and Qt Quick.")
   (home-page (package-home-page qtbase))
   (license (package-license qtbase))))

qtgraphs
