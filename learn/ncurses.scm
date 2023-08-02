(use-modules (ncurses curses))

;; ncurses allows for the program to take advantange ot the capabilities
;; the terminal window that is present.
;; A window is comprised to the area of a terminal
;; Windows are comprised of cells
;; Cells are just characters but with attributes attached. Boldness, underline etc
;; rendition
;; coordinates start at top left 0,0

;; Two types of characters
;; simple characters are native guile types
;; complex characters are ncurses defined: simple char plus modifying chars that
;; affect the rendering

;; there are several opaque types in guile-ncurses, implemented using smobs
;; window: contains information about chars making up a window
;; screen: repesents the physical terminal
;; field: text input box

;; all this program does is clear the screen, displays hello world
;; and terminates on a user key

;; initialize screen, clear everything and allocates ncurses memory
;; stdscr is a window smob. defines everything that can be done
(define stdscr (initscr))
;; add characters to screen
(addstr stdscr "Hello World")
;; display, always remember to call this on 
(refresh stdscr)
;; ask for user input
(getch stdscr)

;; end the ncurses things
(endwin)