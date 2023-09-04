(define-module (vim-vimwiki)
  #:use-module (guix packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy))

(define-public vim-vimwiki
  (package
    (name "vim-vimwiki")
    (version "2023.04.04_1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/vimwiki/vimwiki")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0c08c24i17h2zykbsm0lv1brscwsbmyf9lvqh9zbi8ikbfswr5b7"))))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan
        '(("autoload" "share/vim/vimfiles/")
          ("doc" "share/vim/vimfiles/")
          ("ftplugin" "share/vim/vimfiles/")
          ("plugin" "share/vim/vimfiles/")
          ("syntax" "share/vim/vimfiles/"))))
    (home-page "https://github.com/vimwiki/vimwiki")
    (synopsis "VimWiki is a personal wiki for Vim -- a number of linked text
              files that have their own syntax highlighting.")
    (description "With VimWiki, you can:
                 @enumerate
                 @item Organize notes and ideas
                 @item Manage to-do lists
                 @item Write documentation
                 @item Maintain a diary
                 @item Export everything to HTML
                 @end enumerate

                 To do a quick start, press <Leader>ww (default is \\ww) to go
                 to your index wiki file. By default, it is located in
                 ~/vimwiki/index.wiki. See :h vimwiki_list for registering a
                 different path/wiki.

                 Prerequisites

                 Make sure you have these settings in your vimrc file:

                 @itemize
                 @item @code{set nocompatible}
                 @item @code{filetype plugin on}
                 @item @code{syntax on}
                 @end itemize")
    (license expat)))

vim-vimwiki
