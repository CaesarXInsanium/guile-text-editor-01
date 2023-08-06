(define-module (texf normal))
(use-modules (ncurses curses)
             (texf state)
             ;;(texf logger)
             (texf))

(define (normal-mode screen state key)
  (case key
    ((#\j) (display "j is pressed\n"))
    ((#\k) (display "k is pressed\n"))))

(export normal-mode)
               
