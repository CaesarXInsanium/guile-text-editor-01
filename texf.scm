(define-module (texf))

;; Imports
(use-modules (ncurses curses)
             (ice-9 textual-ports)) ;; read strings from ports

;; texf imports
(use-modules (texf text)
             (texf state)
             (texf normal)
             (texf constants)
             (texf buffer)
             (texf draw))


(define (main-loop state screen)
  (if (state-quit? state)
    (state-quit! state)
    (let ((new-state (process-keypress screen state)))
      (begin (draw-screen (state-render state) screen)
             (main-loop state screen)))))

(define (texf-main args)
  (let ((file-port (open-file (list-ref args 1) "r")))
    (begin (define stdscr (initscr))
           (noecho!)
           (cbreak!)
           (keypad! stdscr #t)
           (define bf_obj (load-buffer-object file-port))
           (define screen-lines (lines))
           (define screen-columns (cols))
           ;; (define buffer-lines (string-split text #\newline))
           (define slices (slice (buffer-lines bf_obj) 0 screen-lines))
           (define state (make-state (list bf_obj) normal-mode '() (cons screen-lines screen-columns) #f))
           (define final-state (main-loop state stdscr))
           (endwin))))

(define (start-texf config)
  (display "Starting Texf Editor")
  (display config)
  (newline))

(export texf-main)
