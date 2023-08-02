(define-module (texf))

;; Imports
(use-modules (ncurses curses)
             (ice-9 textual-ports)) ;; read strings from ports

(define (texf-main args)
  (let ((buffer-port (open-file (list-ref args 1) "r")))
      (begin (define stdscr (initscr))
             (addstr stdscr (get-string-all buffer-port))
             (refresh stdscr)
             (getch stdscr)
             (endwin))))

(define (start-tecf config)
  (display "Starting Texf Editor")
  (display config)
  (newline))

(export texf-main)