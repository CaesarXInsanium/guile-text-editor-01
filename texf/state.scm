(define-module (texf state))
(use-modules (ncurses curses)
             (texf buffer))

;; State that the editor is in
;; state contains information neccesary to track edits, open buffers and avaiable commands
;; buffers is just a vector of pairs of strings and file ports
(define (make-state buffers mode commands dims should_quit)
  (vector buffers mode commands dims should_quit))


;; is this a state object?
(define (state? state)
  (and (vector? state)
       (= 5 (vector-lenght state))
       (list? (vector-ref state 0))
       (proc? (vector-ref state 1))
       (list? (vector-ref state 2))
       (pair? (vector-ref state 3))
       (bool? (vector-ref state 4))))

(define (state-buffers state) (vector-ref state 0))
(define (state-mode state) (vector-ref state 1))
(define (state-commands state) (vector-ref state 2))
(define (state-width state) (cdr (vector-ref state 3)))
(define (state-height state) (car (vector-ref state 3)))

(define (state-quit-set state)
  (vector-set! state 4 #t))

(define (state-quit? state)
  (vector-ref state 4))

(define (state-quit! state)
  (map (lambda (bf)
         (close-buffer-object bf))
       (state-buffers state)))

(define (state-render state)
  (map (lambda (bf)
         (buffer-render bf))
       (state-buffers state)))

;; in essence a mode is simply a procedure that takes a state and a screen and determines what to do with
;; a keypress
;; returns a new state
(define (process-keypress screen state)
  (let ((mode (state-mode state)))
    (if (not (procedure? mode))
      (error "Mode is not a procedure!")
      (let ((key (getch screen)))
          (mode screen state key)))))
        
    

(export make-state
        state?
        state-quit?
        state-quit!
        state-mode
        state-commands
        state-buffers
        state-render
        state-quit-set
        process-keypress)
