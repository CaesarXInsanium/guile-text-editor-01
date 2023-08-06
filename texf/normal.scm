(define-module (texf normal))
(use-modules (ncurses curses)
             (texf state)
             ;;(texf logger)
             (texf)
             (texf constants))

(define (normal-mode screen state key)
  (case key
    ((#\j) (logger "j is pressed\n"))
    ((#\k) (logger "k is pressed\n"))
    ((#\q) (begin (logger "q is pressed, quit!")
                  (state-quit-set state)))))

(export normal-mode)
               
