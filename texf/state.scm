(define-module (texf state))
(use-modules (ncurses curses))

;; State that the editor is in
;; state contains information neccesary to track edits, open buffers and avaiable commands
;; buffers is just a vector of pairs of strings and file ports
(define (make-state buffers mode commands dims)
  (vector buffers mode commands dims))


;; is this a state object?
(define (state? state)
  (and (vector? state)
       (= 4 (vector-lenght state))
       (list? (vector-ref state 0))
       (proc? (vector-ref state 1))
       (list? (vector-ref state 2))
       (pair? (vector-ref state 3))))

(define (state-buffers state) (vector-ref state 0))
(define (state-mode state) (vector-ref state 1))
(define (state-commands state) (vector-ref state 2))
(define (state-width state) (cdr (vector-ref state 3)))
(define (state-height state) (car (vector-ref state 3)))

(define (state-quit? state)
  (error "Not implement state-quit? yet"))

(define (state-quit! state)
  (error "state-quit not implemented yet!"))

;; in essence a mode is simply a procedure that takes a state and a screen and determines what to do with
;; a keypress
;; returns a new state
(define (process-keypress screen state)
  (if (not (proc? mode))
    (error "Mode is not a procedure!")
    (let ((key (getch)))
        ((state-mode state) screen state key))))
        
    

(export make-state
        state?
        state-quit?
        state-quit!
        state-mode
        state-commands
        state-buffers
        process-keypress)
