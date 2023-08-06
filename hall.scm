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
           ((directory
              "texf"
              ((scheme-file "render")
               (scheme-file "constants")
               (scheme-file "window")
               (scheme-file "normal")
               (scheme-file "buffer")
               (scheme-file "text")
               (scheme-file "input_mode")
               (scheme-file "draw")
               (scheme-file "state")))))
         (tests ((directory "tests" ())))
         (programs
           ((directory "scripts" ((text-file "texf")))))
         (documentation
           ((symlink "README" "README.org")
            (text-file "HACKING")
            (text-file "COPYING")
            (directory "doc" ((texi-file "texf")))))
         (infrastructure
           ((scheme-file "guix")
            (text-file ".gitignore")
            (scheme-file "hall")))))
