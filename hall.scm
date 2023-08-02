(hall-description
  (name "texf")
  (prefix "guile")
  (version "0.1")
  (author "Caesar X Insanium")
  (copyright (2023))
  (synopsis "")
  (description "")
  (home-page "")
  (license gpl3+)
  (dependencies
    `(("guile-ncurses" (guile-ncurses) ,guile-ncurses)))
  (skip ())
  (files (libraries
           ((directory "texf" ()) (scheme-file "texf")))
         (tests ((directory "tests" ())))
         (programs
           ((directory "scripts" ((text-file "texf")))))
         (documentation
           ((directory "doc" ((texi-file "texf")))
            (text-file "COPYING")
            (text-file "HACKING")
            (symlink "README" "README.org")
            (org-file "README")))
         (infrastructure
           ((scheme-file "hall")
            (text-file ".gitignore")
            (scheme-file "guix")))))
