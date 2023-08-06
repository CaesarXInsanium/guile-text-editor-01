(define-module (texf buffer))

(use-modules (ice-9 textual-ports)
             (ncurses curses))


(define (load-buffer-object port)
  (let ((text (get-string-all port)))
        
    (make-buffer-object (begin  (seek port 0 SEEK_SET)
                                port)
                        text
                        (string-split text #\newline))))

(define (make-buffer-object port text lines)
  (vector port text lines))

;; buffer object (vec
(define (buffer-object? obj)
  (and (vector? obj)
       (= 3 (vector-length obj))
       (port? (vector-ref obj 0))
       (string? (vector-ref obj 1))
       (list? (vector-ref obj 2))))

(define (buffer-port obj)
  (vector-ref obj 0))
(define (buffer-text obj)
  (vector-ref obj 1))
(define (buffer-lines obj)
  (vector-ref obj 2))

;; Rendering function
(define (buffer-render bf)
  (map (lambda (line)
         (inverse line))
       (buffer-lines bf)))

;; should implement a method of determining wether or not to save a file
(define (save? obj) #f)

(define (close-buffer-object obj)
  (if (save? obj)
    (error "writing and saving file is not implemented")
    (close-port (buffer-port obj))))

(export load-buffer-object
        make-buffer-object
        buffer-object?
        buffer-port
        buffer-text
        buffer-lines
        buffer-render
        close-buffer-object)
