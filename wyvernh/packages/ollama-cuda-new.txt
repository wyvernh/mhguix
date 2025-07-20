(define-module (wyvernh packages ollama)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages version-control)
  #:use-module (guix-science-nonfree packages cuda))

(define-public ollama-cuda
  (package
    (name "ollama-cuda")
    (version "0.1.43")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/ollama/ollama")
               (commit (string-append "v" version))))
        (sha256
          (base32
            "09wxs08yds4i3y8bz2jixfkhc90bk69wg4iy19a75amklclwb0vh"))))
    (build-system go-build-system)
    (arguments
      `(#:import-path "github.com/ollama/ollama"
        #:build-flags '("-tags" "cuda")
        #:phases
        (modify-phases %standard-phases
          (add-before 'build 'set-cuda-env
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "CGO_ENABLED" "1")
              (setenv "CUDA_LIB_DIR" (string-append (assoc-ref inputs "cuda") "/lib"))
              (setenv "CUDACXX" (string-append (assoc-ref inputs "cuda") "/bin/nvcc"))
              ;; Specify the target CUDA architectures your GPU supports.
              (setenv "CMAKE_CUDA_ARCHITECTURES" "native")
              (setenv "GUILE_WARN_DEPRECATED" "detailed")
              #t)))))
    (native-inputs
      (list `("cuda" ,cuda)
            `("cudnn" ,cudnn-8.9.1.23)
            `("go" ,go-1.22) ;; This variable is provided by (gnu packages golang)
            `("git" ,git)))
    (synopsis "Run large language models locally with CUDA acceleration")
    (description
      "Ollama is a tool for running large language models, such as Llama 2, locally.
This package is built with CUDA support, allowing for GPU acceleration on
NVIDIA graphics cards.")
    (home-page "https://ollama.ai/")
    (license license:expat)))

;; (define-public ollama-cuda
;;   (package
;;    (name "ollama-cuda")
;;    (version "0.1.43")
;;    (source
;;     (origin
;;      (method git-fetch)
;;      (uri (git-reference
;;            (url "https://github.com/ollama/ollama")
;;            (commit (string-append "v" version))))
;;      (sha256
;;       (base32
;;        "1k2g6zfrcz6g8w9s7z3yq7z3yq7z3yq7z3yq7z3yq7z3yq7z3yq7"))))
;;    (build-system go-build-system)
;;    (arguments
;;     `(#:import-path "github.com/ollama/ollama"
;;       #:build-flags '("-tags" "cuda")
;;       #:phases
;;       (modify-phases %standard-phases
;;                      (add-before 'build 'set-cuda-env
;;                                  (lambda* (#:key inputs #:allow-other-keys)
;;                                    (setenv "CGO_ENABLED" "1")
;;                                    ;; Ensure CUDA from guix-science-nonfree is found
;;                                    (let ((cuda (assoc-ref inputs "cuda"))
;;                                          (cudnn (assoc-ref inputs "cudnn")))
;;                                      (setenv "CUDA_LIB_DIR" (string-append cuda "/lib"))
;;                 (setenv "CUDACXX" (string-append cuda "/bin/nvcc"))
;;                 ;; Also add cudnn to the library path for the build
;;                 (setenv "LIBRARY_PATH" (string-append cudnn "/lib"))))
;;               ;; Specify the target CUDA architectures your GPU supports.
;;               ;; Example for a Turing architecture (e.g., RTX 20-series):
;;               (setenv "CMAKE_CUDA_ARCHITECTURES" "75")
;;               #t)))))
;;   (native-inputs
;;    (list `("cuda" ,(find-package "cuda"))
;;          `("cudnn" ,(find-package "cudnn"))
;;          go-1.22
;;          git))
;;   (synopsis "Run large language models locally with CUDA acceleration")
;;   (description
;;    "Ollama is a tool for running large language models, such as Llama 2, locally.
;; This package is built with CUDA support, allowing for GPU acceleration on
;; NVIDIA graphics cards.")
;;   (home-page "https://ollama.ai/")
;;   (license license:expat)))

ollama-cuda
