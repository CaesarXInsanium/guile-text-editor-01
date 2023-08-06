(define-module (texf buffer))

(use-modules (ice-9 textual-ports))


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

(define (close-buffer-object obj save)
  (if save
    (error "write contents to port")
    (error "free all memory associated with this thing and close port")))

(export load-buffer-object
        make-buffer-object
        buffer-object?)
