(define-module (texf render))

(use-modules (ncurses curses))


(define (draw-on-screen screen rendered)
  (for-each (lambda (line)
              (addstr screen line)
              (addch screen (bold #\newline)))
            rendered))
