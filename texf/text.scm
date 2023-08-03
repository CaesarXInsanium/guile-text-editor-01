(define-module (texf text))

(use-modules (ncurses curses)
             (ice-9 textual-ports))

(define (complex->normal char)
  (error "complex->normal not implemented"))


(define (buffer->string buffer-list)
  (map (lambda (char)
          (complex->normal char))
       buffer-list))