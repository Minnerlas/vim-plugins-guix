(define-module (vim-fzf)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(use-modules (gnu packages terminals))

(define-public vim-fzf
  (package
    (name "vim-fzf")
    (version "0.42.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/junegunn/fzf")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0bif1w56pddxhbi95qjgg8d1xh2mpn15qn3nqcbnbsz3qvnm3bpv"))))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan
        '(("plugin" "share/vim/vimfiles/"))))
    (propagated-inputs (list fzf))
    (home-page "https://github.com/junegunn/fzf")
    (synopsis "Vim plugin for integrating with fzf")
    (description "It's an interactive Unix filter for command-line that can be
                 used with any list; files, command history, processes,
                 hostnames, bookmarks, git commits, etc.")
                 (license expat)))

vim-fzf
