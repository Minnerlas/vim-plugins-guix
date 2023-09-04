(define-module (vim-hare-vim)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(define-public vim-hare-vim
  (let ((commit "ce32a0c6a622770bd1454069aef9abe95efcbd16")
        (revision "1"))
    (package
      (name "vim-hare-vim")
      (version (string-append "0.0-" revision "." (string-take commit 7)))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://git.sr.ht/~sircmpwn/hare.vim")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32 "1rlarv26amx99dhvgqphrjbwl92vci1v56r565fryqrhbgrwr3a0"))))
      (build-system copy-build-system)
      (arguments
        '(#:install-plan
          '(("compiler" "share/vim/vimfiles/")
            ("ftdetect" "share/vim/vimfiles/")
            ("ftplugin" "share/vim/vimfiles/")
            ("indent" "share/vim/vimfiles/")
            ("syntax" "share/vim/vimfiles/"))))
      (home-page "https://github.com/vimwiki/vimwiki")
      (synopsis "Vim plugin for Hare programming.")
      (description "Vim plugin for Hare programming.")
      (license vim))))

vim-hare-vim
