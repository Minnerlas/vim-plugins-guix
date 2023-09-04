(define-module (vim-presenting-vim)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(define-public vim-presenting-vim
  (let ((commit "8e2b1c0cab9ed9a832b3743dbb65e9966a64331a")
        (revision "1"))
    (package
      (name "vim-presenting-vim")
      (version (string-append "0.1.0-" revision "." (string-take commit 7)))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/sotte/presenting.vim")
                 (commit "e960e204d8e4526d2650c23eaea908317c6becb9")))
          (file-name (git-file-name name version))
          (sha256
            (base32 "1hpid82gdczis0g0pxvx445n2wg7j4zx66fm43zxq08kcv3k5ara"))))
      (build-system copy-build-system)
      (arguments
      '(#:install-plan
        '(("autoload" "share/vim/vimfiles/")
          ("doc" "share/vim/vimfiles/")
          ("examples" "share/vim/vimfiles/")
          ("ftplugin" "share/vim/vimfiles/")
          ("plugin" "share/vim/vimfiles/")
          ("syntax" "share/vim/vimfiles/"))))
      (home-page "https://github.com/sotte/presenting.vim")
      (synopsis "Vim plugin for integrating with fzf")
      (description "It's an interactive Unix filter for command-line that can be
                   used with any list; files, command history, processes,
                   hostnames, bookmarks, git commits, etc.")
                   (license expat))))

vim-presenting-vim
