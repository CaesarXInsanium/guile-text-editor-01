(define-module (texf))

;; Imports
(use-modules (ncurses curses)
             (ice-9 textual-ports)) ;; read strings from ports

(define LOG (open-file "log.txt" "w"))

;; texf imports
(use-modules (texf text))

(define (texf-main args)
  (let ((buffer-port (open-file (list-ref args 1) "r")))
      (begin (define stdscr (initscr))
             (define text (get-string-all buffer-port))
             (define lines (string-split text #\newline))
             (define slices (slice lines 2 3))
             (display slices LOG)
             (draw-on-screen stdscr slices)
             (addstr stdscr (get-string-all buffer-port))
             (refresh stdscr)
             (getch stdscr)
             (endwin))))

(define (start-texf config)
  (display "Starting Texf Editor")
  (display config)
  (newline))

(export texf-main)
