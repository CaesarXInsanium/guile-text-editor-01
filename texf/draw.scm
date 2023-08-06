(define-module (texf draw))
(use-modules (ncurses curses))

(define (draw-screen rendered-buffers screen)
  (if (= 1 (length rendered-buffers))
    (map (lambda (line)
           (addchstr screen line)
           (addch screen (normal #\newline)))
         (car rendered-buffers))
    (error "Can only render one buffer at a time")))

(export draw-screen)

