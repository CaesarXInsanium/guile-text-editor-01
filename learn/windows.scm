(use-modules (ncurses curses))

;; window is a terminal space allocated for display things
(define stdscr (initscr))

;; pushes characters to screen
(addstr stdscr "Hello World!!")

;; There are optional key parameters
;; moves to location and prints
(addstr stdscr "Banana" #:x 20 #:y 20)
(refresh stdscr)
(getch stdscr)
(endwin)

