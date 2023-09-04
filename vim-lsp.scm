(define-module (vim-lsp)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(define-public vim-lsp
  (package
    (name "vim-lsp")
    (version "0.1.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/prabirshrestha/vim-lsp")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1x9rb34a9542rn2dx2kaz4iq83swpq56144h81pr8l080r6vi2l6"))))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan
        '(("autoload" "share/vim/vimfiles/")
          ("doc" "share/vim/vimfiles/")
          ("ftplugin" "share/vim/vimfiles/")
          ("plugin" "share/vim/vimfiles/")
          ("syntax" "share/vim/vimfiles/"))))
    (home-page "https://github.com/prabirshrestha/vim-lsp")
    (synopsis "Async Language Server Protocol plugin for vim8 and neovim.")
    (description "Async Language Server Protocol plugin for vim8 and neovim.")
                 (license expat)))

vim-lsp
