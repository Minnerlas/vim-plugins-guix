(define-module (vim-fetch)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(define-public vim-fetch
  (package
    (name "vim-fetch")
    (version "3.0.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/wsdjeg/vim-fetch")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "11akaxbc0kb2nfngn4a7b319xlcyiaf2ijprv8hld7rn5mma6mw8"))))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan
        '(("autoload" "share/vim/vimfiles/")
          ("doc" "share/vim/vimfiles/")
          ("img" "share/vim/vimfiles/")
          ("plugin" "share/vim/vimfiles/"))))
    (home-page "https://github.com/wsdjeg/vim-fetch")
    (synopsis "vim-fetch enables Vim to process line and column jump
              specifications in file paths")
    (description "vim-fetch enables Vim to process line and column jump
                 specifications in file paths as found in stack traces and
                 similar output. When asked to open such a file, in- or outside
                 Vim or via @code{gF}, Vim with vim-fetch will jump to the specified
                 line (and column, if given) instead of displaying an empty,
                 new file.")
                 (license expat)))

vim-fetch
