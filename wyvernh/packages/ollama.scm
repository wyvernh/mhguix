(define-module (wyvernh packages ollama)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module (guix licenses)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-web))

(define-public go-github-com-d4l3k-go-bfloat16
  (package
   (name "go-github-com-d4l3k-go-bfloat16")
   (version "0.0.0-20211005043715-690c3bdd05f1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/d4l3k/go-bfloat16")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1bshygdr5lcagznrh349r53whqhlg870j484zpsi3f7ilqv08rvy"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/d4l3k/go-bfloat16"))
   (home-page "https://github.com/d4l3k/go-bfloat16")
   (synopsis "go-bfloat16")
   (description "BFloat16 conversion utilities for Go/Golang")
   (license expat)))
(define-public go-github-com-x448-float16
  (package
   (name "go-github-com-x448-float16")
   (version "0.8.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/x448/float16")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0qg6ya30fra20hpa2qzqqzs8l95lvw9yzd87fdzq195xqi6crb2l"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/x448/float16"))
   (home-page "https://github.com/x448/float16")
   (synopsis "Float16 (Binary16) in Go/Golang")
   (description
    "@@code{float16} package provides
  @@url{https://en.wikipedia.org/wiki/Half-precision_floating-point_format,IEEE
  754 half-precision floating-point format (binary16)} with IEEE 754 default
  rounding for conversions.  IEEE 754-2008 refers to this 16-bit floating-point
  format as binary16.")
   (license expat)))
(define-public go-github-com-pierrec-lz4-v4
  (package
   (name "go-github-com-pierrec-lz4-v4")
   (version "4.1.21")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pierrec/lz4")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0nc2aprbw4s6cx2mijaqdswkgnizx8fqb0mzha82wrznl3gz69ni"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/pierrec/lz4/v4"))
   (home-page "https://github.com/pierrec/lz4")
   (synopsis "lz4 : LZ4 compression in pure Go")
   (description
    "Package lz4 implements reading and writing lz4 compressed data.")
   (license bsd-3)))
(define-public go-github-com-cespare-xxhash-v2
  (package
   (name "go-github-com-cespare-xxhash-v2")
   (version "2.2.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cespare/xxhash")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "055xvgyv78xl6bdj8kgy0105n9cq33w4rb0sg84lp9r85i9qx2l5"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/cespare/xxhash/v2"))
   (home-page "https://github.com/cespare/xxhash")
   (synopsis "xxhash")
   (description
    "Package xxhash implements the 64-bit variant of @code{xxHash} (XXH64) as
  described at
  @@url{http://cyan4973.github.io/@code{xxHash/,http://cyan4973.github.io/xxHash}/}.")
   (license expat)))
go-github-com-cespare-xxhash-v2
(define-public go-github-com-cncf-udpa-go
  (package
   (name "go-github-com-cncf-udpa-go")
   (version "0.0.0-20220112060539-c52dc94e7fbe")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cncf/udpa")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1i3nm1hxc4am3a7d9wxvf0ia420qg1xpwflcc0z19lxn952bdbnd"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/cncf/udpa/go"
     #:unpack-path "github.com/cncf/udpa"))
   (propagated-inputs `(("go-github-com-cncf-xds-go" ,go-github-com-cncf-xds-go)))
   (home-page "https://github.com/cncf/udpa")
   (synopsis "Description")
   (description
    "This library has been deprecated in favor of @@code{github.com/cncf/xds/go}.
  All users are recommended to switch their imports.")
   (license asl2.0)))
(define-public go-github-com-census-instrumentation-opencensus-proto
  (package
   (name "go-github-com-census-instrumentation-opencensus-proto")
   (version "0.4.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/census-instrumentation/opencensus-proto")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0zda7v8fqbc2hamnwajdwr9742nznajxgcw636n570v8k5ahrymw"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go go-1.18
     #:import-path "github.com/census-instrumentation/opencensus-proto"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-github-com-grpc-ecosystem-grpc-gateway-v2" ,go-github-com-grpc-ecosystem-grpc-gateway-v2)))
   (home-page "https://github.com/census-instrumentation/opencensus-proto")
   (synopsis
    "OpenCensus Proto - Language Independent Interface Types For OpenCensus")
   (description
    "Census provides a framework to define and collect stats against metrics and to
  break those stats down across user-defined dimensions.")
   (license asl2.0)))
(define-public go-cel-dev-expr
  (package
   (name "go-cel-dev-expr")
   (version "0.15.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/cel-spec")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "060pf1iavl8ayf7bv1chvbw339as5jzpchihrmqmkkkx4i6xrvpc"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go go-1.18
     #:import-path "cel.dev/expr"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-genproto-googleapis-rpc" ,go-google-golang-org-genproto-googleapis-rpc)))
   (home-page "https://cel.dev/expr")
   (synopsis "Common Expression Language")
   (description
    "The Common Expression Language (CEL) implements common semantics for expression
  evaluation, enabling different applications to more easily interoperate.")
   (license asl2.0)))
(define-public go-github-com-cncf-xds-go
  (package
   (name "go-github-com-cncf-xds-go")
   (version "0.0.0-20240329184929-0c46c01016dc")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cncf/xds")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0m0kbfyhplplbwc3pmqgb118nl9hls7741wizbs45366210m1jyb"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "github.com/cncf/xds/go"
     #:unpack-path "github.com/cncf/xds"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-google-golang-org-genproto-googleapis-api" ,go-google-golang-org-genproto-googleapis-api)
                        ("go-github-com-envoyproxy-protoc-gen-validate" ,go-github-com-envoyproxy-protoc-gen-validate)
                        ("go-cel-dev-expr" ,go-cel-dev-expr)))
   (home-page "https://github.com/cncf/xds")
   (synopsis #f)
   (description #f)
   (license asl2.0)))
(define-public go-github-com-iancoleman-strcase
  (package
   (name "go-github-com-iancoleman-strcase")
   (version "0.3.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/iancoleman/strcase")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "169fb56kiif2gq92b7hvh9xgl2n8kjmdg4gqaa1492kb97ia8lwm"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/iancoleman/strcase"))
   (home-page "https://github.com/iancoleman/strcase")
   (synopsis "strcase")
   (description
    "Package strcase converts strings to various cases.  See the conversion table
  below:")
   (license expat)))
(define-public go-github-com-lyft-protoc-gen-star-v2
  (package
   (name "go-github-com-lyft-protoc-gen-star-v2")
   (version "2.0.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/lyft/protoc-gen-star")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0c0w7xlarzkmbfsxdknakmnm562q3whxgs3ck3icwrva3dim94qc"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/lyft/protoc-gen-star/v2"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-golang-org-x-tools" ,go-golang-org-x-tools)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-spf13-afero" ,go-github-com-spf13-afero)))
   (home-page "https://github.com/lyft/protoc-gen-star")
   (synopsis "protoc-gen-star (PG*)")
   (description "Package pgs provides a library for building protoc plugins")
   (license asl2.0)))
(define-public go-github-com-envoyproxy-protoc-gen-validate
  (package
   (name "go-github-com-envoyproxy-protoc-gen-validate")
   (version "1.0.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bufbuild/protoc-gen-validate")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0lp21pnbgc6jrwy2c6k6xafkldlf25iwlblgzdvci1s2vraw3y1l"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "github.com/envoyproxy/protoc-gen-validate"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-golang-org-x-net" ,go-golang-org-x-net)
                        ("go-github-com-lyft-protoc-gen-star-v2" ,go-github-com-lyft-protoc-gen-star-v2)
                        ("go-github-com-iancoleman-strcase" ,go-github-com-iancoleman-strcase)))
   (home-page "https://github.com/envoyproxy/protoc-gen-validate")
   (synopsis "protoc-gen-validate (PGV)")
   (description
    "PGV is a protoc plugin to generate polyglot message validators.  While protocol
  buffers effectively guarantee the types of structured data, they cannot enforce
  semantic rules for values.  This plugin adds support to protoc-generated code to
  validate such constraints.")
   (license asl2.0)))
(define-public go-github-com-antihax-optional
  (package
   (name "go-github-com-antihax-optional")
   (version "1.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/antihax/optional")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1ix08vl49qxr58rc6201cl97g1yznhhkwvqldslawind99js4rj0"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/antihax/optional"))
   (home-page "https://github.com/antihax/optional")
   (synopsis #f)
   (description #f)
   (license expat)))
(define-public go-github-com-rogpeppe-fastuuid
  (package
   (name "go-github-com-rogpeppe-fastuuid")
   (version "1.2.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rogpeppe/fastuuid")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "028acdg63zkxpjz3l639nlhki2l0canr2v5jglrmwa1wpjqcfff8"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/rogpeppe/fastuuid"))
   (home-page "https://github.com/rogpeppe/fastuuid")
   (synopsis "fastuuid")
   (description
    "Package fastuuid provides fast UUID generation of 192 bit universally unique
  identifiers.")
   (license bsd-3)))
(define-public go-github-com-grpc-ecosystem-grpc-gateway-v2
  (package
   (name "go-github-com-grpc-ecosystem-grpc-gateway-v2")
   (version "2.19.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc-ecosystem/grpc-gateway")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "16mypgc1yzp3zap5ra5n0jh3ycf7gdbdcbwgiag2jjnf0yjr1l89"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "github.com/grpc-ecosystem/grpc-gateway/v2"))
   (propagated-inputs `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
                        ("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-google-golang-org-genproto-googleapis-rpc" ,go-google-golang-org-genproto-googleapis-rpc)
                        ("go-google-golang-org-genproto-googleapis-api" ,go-google-golang-org-genproto-googleapis-api)
                        ("go-golang-org-x-text" ,go-golang-org-x-text)
                        ("go-golang-org-x-oauth2" ,go-golang-org-x-oauth2)
                        ("go-github-com-rogpeppe-fastuuid" ,go-github-com-rogpeppe-fastuuid)
                        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)
                        ("go-github-com-antihax-optional" ,go-github-com-antihax-optional)))
   (home-page "https://github.com/grpc-ecosystem/grpc-gateway")
   (synopsis "About")
   (description
    "The @code{gRPC-Gateway} is a plugin of the Google protocol buffers compiler
  @@url{https://github.com/protocolbuffers/protobuf,protoc}.  It reads protobuf
  service definitions and generates a reverse-proxy server which translates a
  RESTful HTTP API into @code{gRPC}.  This server is generated according to the
  @@url{https://github.com/googleapis/googleapis/raw/master/google/api/http.proto#L46,(code
  google.api.http)} annotations in your service definitions.")
   (license bsd-3)))
(define-public go-go-opentelemetry-io-proto-otlp
  (package
   (name "go-go-opentelemetry-io-proto-otlp")
   (version "1.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-proto-go")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "14lclcc09r88vschab5768vsbbriimfdf0pra22366mfn9b9fykb"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "go.opentelemetry.io/proto/otlp"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-github-com-grpc-ecosystem-grpc-gateway-v2" ,go-github-com-grpc-ecosystem-grpc-gateway-v2)))
   (home-page "https://go.opentelemetry.io/proto/otlp")
   (synopsis #f)
   (description #f)
   (license asl2.0)))
(define-public go-google-golang-org-genproto-googleapis-rpc
  (package
   (name "go-google-golang-org-genproto-googleapis-rpc")
   (version "0.0.0-20240325203815-454cdb8f5daa")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/go-genproto")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0fg1d0rmzsgz97fpa0ymhqsf77djd1xqkg3zp2z72hi14mfxdqch"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "google.golang.org/genproto/googleapis/rpc"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)))
   (home-page "https://google.golang.org/genproto/googleapis/rpc")
   (synopsis #f)
   (description #f)
   (license asl2.0)))
(define-public go-google-golang-org-genproto-googleapis-api
  (package
   (name "go-google-golang-org-genproto-googleapis-api")
   (version "0.0.0-20240325203815-454cdb8f5daa")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/go-genproto")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0fg1d0rmzsgz97fpa0ymhqsf77djd1xqkg3zp2z72hi14mfxdqch"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "google.golang.org/genproto/googleapis/api"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-google-golang-org-genproto-googleapis-rpc" ,go-google-golang-org-genproto-googleapis-rpc)))
   (home-page "https://google.golang.org/genproto/googleapis/api")
   (synopsis #f)
   (description #f)
   (license asl2.0)))
(define-public go-github-com-envoyproxy-go-control-plane
  (package
   (name "go-github-com-envoyproxy-go-control-plane")
   (version "0.12.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/envoyproxy/go-control-plane")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0z80d21nbrybgabhz3djvq3ksx545zlq16dwaws9qhm0n7y5nnp6"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/envoyproxy/go-control-plane"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-google-golang-org-genproto-googleapis-rpc" ,go-google-golang-org-genproto-googleapis-rpc)
                        ("go-google-golang-org-genproto-googleapis-api" ,go-google-golang-org-genproto-googleapis-api)
                        ("go-go-opentelemetry-io-proto-otlp" ,go-go-opentelemetry-io-proto-otlp)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-prometheus-client-model" ,go-github-com-prometheus-client-model)
                        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)
                        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)
                        ("go-github-com-envoyproxy-protoc-gen-validate" ,go-github-com-envoyproxy-protoc-gen-validate)
                        ("go-github-com-cncf-xds-go" ,go-github-com-cncf-xds-go)
                        ("go-github-com-census-instrumentation-opencensus-proto" ,go-github-com-census-instrumentation-opencensus-proto)))
   (home-page "https://github.com/envoyproxy/go-control-plane")
   (synopsis "control-plane")
   (description
    "This repository contains a Go-based implementation of an API server that
  implements the discovery service APIs defined in
  @@url{https://github.com/envoyproxy/data-plane-api,data-plane-api}.")
   (license asl2.0)))
(define-public go-github-com-golang-glog
  (package
   (name "go-github-com-golang-glog")
   (version "1.2.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/glog")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "045k834g6br296wzaglh7z2wlgd61mvz1w74naip8v0nbd9a89bq"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "github.com/golang/glog"))
   (home-page "https://github.com/golang/glog")
   (synopsis "glog")
   (description
    "Package glog implements logging analogous to the Google-internal C++
  INFO/ERROR/V setup.  It provides functions that have a name matched by regex:")
   (license asl2.0)))
(define-public go-google-golang-org-grpc
  (package
   (name "go-google-golang-org-grpc")
   (version "1.62.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc/grpc-go")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0sa9jx4pjzd0gdix8lzalxq0ry32lkr4mkswx7rxcrawpy0yjy3x"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.19
     #:import-path "google.golang.org/grpc"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-genproto-googleapis-rpc" ,go-google-golang-org-genproto-googleapis-rpc)
                        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
                        ("go-golang-org-x-sync" ,go-golang-org-x-sync)
                        ("go-golang-org-x-oauth2" ,go-golang-org-x-oauth2)
                        ("go-golang-org-x-net" ,go-golang-org-x-net)
                        ("go-github-com-google-uuid" ,go-github-com-google-uuid)
                        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)
                        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)
                        ("go-github-com-golang-glog" ,go-github-com-golang-glog)
                        ("go-github-com-envoyproxy-go-control-plane" ,go-github-com-envoyproxy-go-control-plane)
                        ("go-github-com-cncf-xds-go" ,go-github-com-cncf-xds-go)
                        ("go-github-com-cncf-udpa-go" ,go-github-com-cncf-udpa-go)
                        ("go-github-com-cespare-xxhash-v2" ,go-github-com-cespare-xxhash-v2)))
   (home-page "https://google.golang.org/grpc")
   (synopsis "gRPC-Go")
   (description "Package grpc implements an RPC system called @code{gRPC}.")
   (license asl2.0)))
(define-public go-github-com-apache-arrow-go-arrow
  (package
   (name "go-github-com-apache-arrow-go-arrow")
   (version "0.0.0-20211112161151-bc219186db40")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apache/arrow")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "03nh7c0i3y9rkkzw428knalkrlpb8syr459i00mwp072ijn8v4hx"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/apache/arrow/go/arrow"
     #:unpack-path "github.com/apache/arrow"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-google-golang-org-grpc" ,go-google-golang-org-grpc)
                        ("go-gonum-org-v1-gonum" ,go-gonum-org-v1-gonum)
                        ("go-golang-org-x-xerrors" ,go-golang-org-x-xerrors)
                        ("go-golang-org-x-exp" ,go-golang-org-x-exp)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-pierrec-lz4-v4" ,go-github-com-pierrec-lz4-v4)
                        ("go-github-com-klauspost-compress" ,go-github-com-klauspost-compress)
                        ("go-github-com-google-flatbuffers" ,go-github-com-google-flatbuffers)
                        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)))
   (home-page "https://github.com/apache/arrow")
   (synopsis #f)
   (description "Package arrow provides an implementation of Apache Arrow.")
   (license asl2.0)))
(define-public go-github-com-chewxy-hm
  (package
   (name "go-github-com-chewxy-hm")
   (version "1.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chewxy/hm")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0f4qwg1q2lc9y64wrl9qxyimqnnandlqg78gn3yv4vsmyci025r7"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/chewxy/hm"))
   (home-page "https://github.com/chewxy/hm")
   (synopsis "hm")
   (description
    "Package hm is a simple Hindley-Milner type inference system in Go.  It provides
  the necessary data structures and functions for creating such a system.")
   (license expat)))
(define-public go-github-com-google-go-cmp
  (package
   (name "go-github-com-google-go-cmp")
   (version "0.6.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/go-cmp")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1n1j4hi50bl05pyys4i7y417k9g6k1blslj27z327qny7kkdl2ma"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/google/go-cmp"))
   (home-page "https://github.com/google/go-cmp")
   (synopsis "Package for equality of Go values")
   (description
    "This package is intended to be a more powerful and safer alternative to
  @@code{reflect.@code{DeepEqual}} for comparing whether two values are
  semantically equal.")
   (license bsd-3)))
(define-public go-github-com-golang-protobuf
  (package
   (name "go-github-com-golang-protobuf")
   (version "1.5.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/protobuf")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1bk7sa9ymi87hd2fv9jamxnxb3qjriamf2nsm8avp6ka37mrkz01"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/golang/protobuf"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)))
   (home-page "https://github.com/golang/protobuf")
   (synopsis "Go support for Protocol Buffers")
   (description
    "This module (@@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
  github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
   (license bsd-3)))
(define-public go-github-com-google-flatbuffers
  (package
   (name "go-github-com-google-flatbuffers")
   (version "24.3.25+incompatible")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/flatbuffers")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0q066x1h0x9225aj25jv40gxgz46yvwmiqc2g6q06mkkg1144kxq"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/google/flatbuffers"))
   (home-page "https://github.com/google/flatbuffers")
   (synopsis "FlatBuffers")
   (description
    "@@strong{@code{FlatBuffers}} is a cross platform serialization library
  architected for maximum memory efficiency.  It allows you to directly access
  serialized data without parsing/unpacking it first, while still having great
  forwards/backwards compatibility.")
   (license asl2.0)))
(define-public go-go4-org-unsafe-assume-no-moving-gc
  (package
   (name "go-go4-org-unsafe-assume-no-moving-gc")
   (version "0.0.0-20231121144256-b99613f794b6")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go4org/unsafe-assume-no-moving-gc")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "00ny3qha8k9nnx37ryvls2n5r7lw3bnldz6kwdmjxk8s19mxqim7"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "go4.org/unsafe/assume-no-moving-gc"))
   (home-page "https://go4.org/unsafe/assume-no-moving-gc")
   (synopsis "go4.org/unsafe/assume-no-moving-gc")
   (description
    "Package go4.org/unsafe/assume-no-moving-gc exists so you can depend on it from
  unsafe code that wants to declare that it assumes that the Go runtime does not
  use a moving garbage collector.  Specifically, it asserts that the caller is
  playing stupid games with the addresses of heap-allocated values.  It says
  nothing about values that Go's escape analysis keeps on the stack.  Ensuring
  things aren't stack-allocated is the caller's responsibility.")
   (license bsd-3)))
(define-public go-github-com-chewxy-math32
  (package
   (name "go-github-com-chewxy-math32")
   (version "1.10.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chewxy/math32")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0ivzsi157cizfq6j06drm08pp79pcd10knwwzqsg7741lrrxgpkj"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/chewxy/math32"))
   (home-page "https://github.com/chewxy/math32")
   (synopsis "math32")
   (description
    "Package math32 provides basic constants and mathematical functions for float32
  types.")
   (license bsd-2)))
(define-public go-gorgonia-org-vecf32
  (package
   (name "go-gorgonia-org-vecf32")
   (version "0.9.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gorgonia/vecf32")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0jggbf98fbbip7znx5m4n2lqqsnw5kqycj3gcbs62ypirr1pp0m9"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "gorgonia.org/vecf32"))
   (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-pmezard-go-difflib" ,go-github-com-pmezard-go-difflib)
                        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
                        ("go-github-com-chewxy-math32" ,go-github-com-chewxy-math32)))
   (home-page "https://gorgonia.org/vecf32")
   (synopsis "vecf32")
   (description
    "Package vecf32 provides common functions and methods for slices of float32.")
   (license expat)))
(define-public go-gorgonia-org-vecf64
  (package
   (name "go-gorgonia-org-vecf64")
   (version "0.9.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gorgonia/vecf64")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0a8v65cy6gyh7ww2g8q4p6dmjhcd6k7lm7z8ly4vmi4k0vq1w187"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "gorgonia.org/vecf64"))
   (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-pmezard-go-difflib" ,go-github-com-pmezard-go-difflib)
                        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
   (home-page "https://gorgonia.org/vecf64")
   (synopsis "vecf64")
   (description
    "Package vecf64 provides common functions and methods for slices of float64.")
   (license expat)))
(define-public go-github-com-pdevine-tensor
  (package
   (name "go-github-com-pdevine-tensor")
   (version "0.0.0-20240228013915-64ccaa8d9ca9")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pdevine/tensor")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "09wzx0d6nz5dkrcq2kacxwbr85hckva8494979rikgpf2qmmv4bk"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.22
     #:import-path "github.com/pdevine/tensor"))
   (propagated-inputs `(("go-gorgonia-org-vecf64" ,go-gorgonia-org-vecf64)
                        ("go-gorgonia-org-vecf32" ,go-gorgonia-org-vecf32)
                        ("go-gonum-org-v1-gonum" ,go-gonum-org-v1-gonum)
                        ("go-go4-org-unsafe-assume-no-moving-gc" ,go-go4-org-unsafe-assume-no-moving-gc)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-pkg-errors" ,go-github-com-pkg-errors)
                        ("go-github-com-google-flatbuffers" ,go-github-com-google-flatbuffers)
                        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)
                        ("go-github-com-gogo-protobuf" ,go-github-com-gogo-protobuf)
                        ("go-github-com-chewxy-math32" ,go-github-com-chewxy-math32)
                        ("go-github-com-chewxy-hm" ,go-github-com-chewxy-hm)
                        ("go-github-com-apache-arrow-go-arrow" ,go-github-com-apache-arrow-go-arrow)))
   (home-page "https://github.com/pdevine/tensor")
   (synopsis "Package")
   (description
    "Package tensor is a package that provides efficient, generic n-dimensional
  arrays in Go.  Also in this package are functions and methods that are used
  commonly in arithmetic, comparison and linear algebra operations.")
   (license asl2.0)))
(define-public go-github-com-chenzhuoyu-base64x
  (package
   (name "go-github-com-chenzhuoyu-base64x")
   (version "0.0.0-20230717121745-296ad89f973d")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chenzhuoyu/base64x")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1w7wd3pqwqlf8sp7c38gdxhfv63q8pajha6fdxqf9nmhn6y7a836"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/chenzhuoyu/base64x"))
   (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-klauspost-cpuid-v2" ,go-github-com-klauspost-cpuid-v2)
                        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
                        ("go-github-com-bytedance-sonic" ,go-github-com-bytedance-sonic)))
   (home-page "https://github.com/chenzhuoyu/base64x")
   (synopsis "base64x")
   (description
    "High performance drop-in replacement of the @@code{encoding/base64} library.")
   (license asl2.0)))
(define-public go-github-com-knz-go-libedit
  (package
   (name "go-github-com-knz-go-libedit")
   (version "1.10.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/knz/go-libedit")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "04a5ryzldsk7agybcz4rpd7g1v5vh7smawlky58bwj0341083p44"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/knz/go-libedit"))
   (home-page "https://github.com/knz/go-libedit")
   (synopsis "go-libedit")
   (description
    "Go wrapper around @@code{libedit}, a replacement to GNU readline using the BSD
  license.")
   (license asl2.0)))
(define-public go-nullprogram-com-x-optparse
  (package
   (name "go-nullprogram-com-x-optparse")
   (version "1.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/skeeto/optparse-go")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1yzpzlhmxdm8gd8ikh9c91qmshjp1jg49l0qsslmm432wk19zym9"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "nullprogram.com/x/optparse"))
   (home-page "https://nullprogram.com/x/optparse")
   (synopsis "Traditional long option parser for Go")
   (description
    "Package optparse parses command line arguments very similarly to GNU
  getopt_long().  It supports long options and optional arguments, but does not
  permute arguments.  It is intended as a replacement for Go's flag package.")
   (license unlicense)))
(define-public go-github-com-chenzhuoyu-iasm
  (package
   (name "go-github-com-chenzhuoyu-iasm")
   (version "0.9.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chenzhuoyu/iasm")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0cayhyxizz43rdbjrk0xgmh6z6dvdq3r5hdswdbh65zqmzczq5zd"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/chenzhuoyu/iasm"))
   (propagated-inputs `(("go-nullprogram-com-x-optparse" ,go-nullprogram-com-x-optparse)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-knz-go-libedit" ,go-github-com-knz-go-libedit)
                        ("go-github-com-klauspost-cpuid-v2" ,go-github-com-klauspost-cpuid-v2)
                        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
   (home-page "https://github.com/chenzhuoyu/iasm")
   (synopsis "-- Interactive Assembler for Go.")
   (description "Dual-purpose assembly engine written in pure Golang.")
   (license asl2.0)))
(define-public go-github-com-klauspost-cpuid-v2
  (package
   (name "go-github-com-klauspost-cpuid-v2")
   (version "2.2.7")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/klauspost/cpuid")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0i1y5zgcj350l3idqfxjkcs18ii5w315xjmmabqbqrx27sn8fqh1"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/klauspost/cpuid/v2"))
   (propagated-inputs `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
   (home-page "https://github.com/klauspost/cpuid")
   (synopsis "cpuid")
   (description
    "Package cpuid provides information about the CPU running the current program.")
   (license expat)))
(define-public go-github-com-twitchyliquid64-golang-asm
  (package
   (name "go-github-com-twitchyliquid64-golang-asm")
   (version "0.15.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/twitchyliquid64/golang-asm")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1akw41i0snxqw9lqzmnn4gx6hd5js5dr1vmfkm49wxans4k14vw4"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/twitchyliquid64/golang-asm"))
   (home-page "https://github.com/twitchyliquid64/golang-asm")
   (synopsis "golang-asm")
   (description
    "This package provides a mirror of the assembler from the Go compiler, with
  import paths re-written for the assembler to be functional as a standalone
  library.")
   (license bsd-3)))
(define-public go-rsc-io-pdf
  (package
   (name "go-rsc-io-pdf")
   (version "0.1.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rsc/pdf")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "01qjjwa8nn5a2jzd360xqg5zc8s0i2fpwcn2w2g6y2jgn9wl8x84"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "rsc.io/pdf"))
   (home-page "https://rsc.io/pdf")
   (synopsis #f)
   (description "Package pdf implements reading of PDF files.")
   (license bsd-3)))
(define-public go-golang-org-x-arch
  (package
   (name "go-golang-org-x-arch")
   (version "0.7.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://go.googlesource.com/arch")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1w96vnb44nphh3v1rxwyl2jmd69v5wqpcffaasg16z70faxzv24n"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go go-1.18
     #:import-path "golang.org/x/arch"))
   (propagated-inputs `(("go-rsc-io-pdf" ,go-rsc-io-pdf)))
   (home-page "https://golang.org/x/arch")
   (synopsis "arch")
   (description
    "This repository holds machine architecture information used by the Go toolchain.
   The parts needed in the main Go repository are copied in.")
   (license bsd-3)))
(define-public go-github-com-bytedance-sonic
  (package
   (name "go-github-com-bytedance-sonic")
   (version "1.11.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bytedance/sonic")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0fid22vl8aza2dq87v5ryrxr4dq776k1v78bc3bnlb62a1w03j8s"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/bytedance/sonic"))
   (propagated-inputs `(("go-golang-org-x-arch" ,go-golang-org-x-arch)
                        ("go-github-com-twitchyliquid64-golang-asm" ,go-github-com-twitchyliquid64-golang-asm)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-klauspost-cpuid-v2" ,go-github-com-klauspost-cpuid-v2)
                        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
                        ("go-github-com-chenzhuoyu-iasm" ,go-github-com-chenzhuoyu-iasm)
                        ("go-github-com-chenzhuoyu-base64x" ,go-github-com-chenzhuoyu-base64x)))
   (home-page "https://github.com/bytedance/sonic")
   (synopsis "Sonic")
   (description
    "English |
  @@url{https://github.com/bytedance/sonic/blob/v1.11.3/README_ZH_CN.md,中文}")
   (license asl2.0)))
(define-public go-github-com-gin-contrib-sse
  (package
   (name "go-github-com-gin-contrib-sse")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gin-contrib/sse")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "072nq91a65n5xvwslqjyvydfd0mfpnvb3vwjyfvmzm1ym96wr1nd"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/gin-contrib/sse"))
   (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)))
   (home-page "https://github.com/gin-contrib/sse")
   (synopsis "Server-Sent Events")
   (description
    "Server-sent events (SSE) is a technology where a browser receives automatic
  updates from a server via HTTP connection.  The Server-Sent Events
  @code{EventSource} API is
  @@url{http://www.w3.org/TR/2009/WD-eventsource-20091029/,standardized as part of
  HTML5[1] by the W3C}.")
   (license expat)))
(define-public go-github-com-modern-go-concurrent
  (package
   (name "go-github-com-modern-go-concurrent")
   (version "0.0.0-20180306012644-bacd9c7ef1dd")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/modern-go/concurrent")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0s0fxccsyb8icjmiym5k7prcqx36hvgdwl588y0491gi18k5i4zs"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/modern-go/concurrent"))
   (home-page "https://github.com/modern-go/concurrent")
   (synopsis "concurrent")
   (description
    "because sync.Map is only available in go 1.9, we can use concurrent.Map to make
  code portable")
   (license asl2.0)))
(define-public go-github-com-modern-go-reflect2
  (package
   (name "go-github-com-modern-go-reflect2")
   (version "1.0.2")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/modern-go/reflect2")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "05a89f9j4nj8v1bchfkv2sy8piz746ikj831ilbp54g8dqhl8vzr"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/modern-go/reflect2"))
   (home-page "https://github.com/modern-go/reflect2")
   (synopsis "reflect2")
   (description "reflect api that avoids runtime reflect.Value cost")
   (license asl2.0)))
(define-public go-github-com-json-iterator-go
  (package
   (name "go-github-com-json-iterator-go")
   (version "1.1.12")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/json-iterator/go")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1c8f0hxm18wivx31bs615x3vxs2j3ba0v6vxchsjhldc8kl311bz"))))
   (build-system go-build-system)
   (arguments
    (list
     #:import-path "github.com/json-iterator/go"))
   (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-modern-go-reflect2" ,go-github-com-modern-go-reflect2)
                        ("go-github-com-modern-go-concurrent" ,go-github-com-modern-go-concurrent)
                        ("go-github-com-google-gofuzz" ,go-github-com-google-gofuzz)
                        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
   (home-page "https://github.com/json-iterator/go")
   (synopsis "Benchmark")
   (description
    "Package jsoniter implements encoding and decoding of JSON as defined in
  @@url{https://rfc-editor.org/rfc/rfc4627.html,RFC 4627} and provides interfaces
  with identical syntax of standard lib encoding/json.  Converting from
  encoding/json to jsoniter is no more than replacing the package with jsoniter
  and variable type declarations (if any).  jsoniter interfaces gives 100%
  compatibility with code using standard lib.")
   (license expat)))
(define-public go-github-com-gin-gonic-gin
  (package
   (name "go-github-com-gin-gonic-gin")
   (version "1.9.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gin-gonic/gin")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "057k3hh7464kfsrdwf7l84i6zpwf7byz4if787g19fjhgv0g4lfw"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.2
     #:import-path "github.com/gin-gonic/gin"))
   (propagated-inputs `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
                        ("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-golang-org-x-net" ,go-golang-org-x-net)
                        ("go-github-com-ugorji-go-codec" ,go-github-com-ugorji-go-codec)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-pelletier-go-toml-v2" ,go-github-com-pelletier-go-toml-v2)
                        ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)
                        ("go-github-com-json-iterator-go" ,go-github-com-json-iterator-go)
                        ("go-github-com-goccy-go-json" ,go-github-com-goccy-go-json)
                        ("go-github-com-go-playground-validator-v10" ,go-github-com-go-playground-validator-v10)
                        ("go-github-com-gin-contrib-sse" ,go-github-com-gin-contrib-sse)
                        ("go-github-com-bytedance-sonic" ,go-github-com-bytedance-sonic)))
   (home-page "https://github.com/gin-gonic/gin")
   (synopsis "Gin Web Framework")
   (description "Package gin implements a HTTP web framework called gin.")
   (license expat)))
(define-public go-github-com-gin-contrib-cors
  (package
   (name "go-github-com-gin-contrib-cors")
   (version "1.7.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gin-contrib/cors")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1h5pslv5zrbax1hmjj6x3mhswp8iy3wrkg7jnqin2cp4m38qzkpf"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go go-1.18
     #:import-path "github.com/gin-contrib/cors"))
   (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-gin-gonic-gin" ,go-github-com-gin-gonic-gin)))
   (home-page "https://github.com/gin-contrib/cors")
   (synopsis "CORS gin's middleware")
   (description "Gin middleware/handler to enable CORS support.")
   (license expat)))

(define-public ollama-wyvernh
  (package
   (name "ollama")
   (version "0.1.30")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ollama/ollama")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "14bf15mbn6nmxr2hs34c7rwmz0fspaf0i93avm3h0qplck4fs6ym"))))
   (build-system go-build-system)
   (arguments
    (list
     #:go 1.22
     #:import-path "github.com/ollama/ollama"))
   (propagated-inputs `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
                        ("go-golang-org-x-term" ,go-golang-org-x-term)
                        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
                        ("go-golang-org-x-exp" ,go-golang-org-x-exp)
                        ("go-golang-org-x-crypto" ,go-golang-org-x-crypto)
                        ("go-github-com-gin-contrib-cors" ,go-github-com-gin-contrib-cors)
                        ("go-github-com-pdevine-tensor" ,go-github-com-pdevine-tensor)
                        ("go-golang-org-x-sync" ,go-golang-org-x-sync)
                        ("go-github-com-x448-float16" ,go-github-com-x448-float16)
                        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                        ("go-github-com-spf13-cobra" ,go-github-com-spf13-cobra)
                        ("go-github-com-olekukonko-tablewriter" ,go-github-com-olekukonko-tablewriter)
                        ("go-github-com-mitchellh-mapstructure" ,go-github-com-mitchellh-mapstructure)
                        ("go-github-com-google-uuid" ,go-github-com-google-uuid)
                        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)
                        ("go-github-com-gin-gonic-gin" ,go-github-com-gin-gonic-gin)
                        ("go-github-com-emirpasic-gods" ,go-github-com-emirpasic-gods)
                        ("go-github-com-d4l3k-go-bfloat16" ,go-github-com-d4l3k-go-bfloat16)
                        ("go-github-com-containerd-console" ,go-github-com-containerd-console)))
   (home-page "https://github.com/ollama/ollama")
   (synopsis "Ollama")
   (description "Get up and running with large language models locally.")
   (license expat)))
