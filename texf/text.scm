(define-module (texf text))

(use-modules (ncurses curses)
             (ice-9 textual-ports))

(define (complex->normal char)
  (error "complex->normal not implemented"))


;; creates list with given range 0 to n
(define (ranged-list n)
  (let ((m n))
    (if (= (- n m) 0)
        '()
        (cons m
              (ranged-list (+ m 1))))))

;; return list lines in given range
;; buffer is a list of strings
;; range is a cons pair with two numbers
;; stolen code
(use-modules (srfi srfi-1))
(define (slice items offset n)
  (take (drop items offset) n))

(define (extract-slice buffer range)
  (let ((lower (car range))
        (upper (cdr range)))
    (map-in-order (lambda (index)
                    (list-ref buffer (+ index lower)))
         (ranged-list (- (cdr range) (car range))))))

;; If a rendered buffer is just a list of lines
(define (draw-on-screen screen rendered)
  (for-each (lambda (line)
              (addstr screen line)
              (addch screen (normal #\newline)))
            rendered))

(export complex->normal
        buffer->string
        ranged-list
        slice
        draw-on-screen)
