(use-modules (ncurses curses))

;; raw! passes all keyboard input, C-c is passed to program directly
;; allows program to process all input as it comes. user does not have to press
;; <CR> in order to pass bytes to program
;; cbreak! C-c is passed normally

;; echo! when char is typed it is display on screen
;; noecho! when char is type nothing is showns

;; keypad! allows for function keys, numpad and arrow keys to be read

;; halfdelay! will wait for user input and if nothing do something else

(define stdscr (initscr))

(raw!) ;; disable line buffering
(keypad! stdscr #t) ;; allow more key input
(noecho!) ;; does not automatically display entered keyboard input
;; will request user for a char
(let ((ch (getch stdscr)))
  (addstr stdscr "The pressed key is")
  (if (char? ch)
    ;; addch will print the value of char
    (addch stdscr (bold ch))
    ;; if key pressed in no alpha then print name
    (addchstr stdscr (bold (keyname ch))))
  ;; draw on screen
  (refresh stdscr)
  (getch stdscr)
  (endwin))

;; given these function it should be possible to make a program that displays 
;; the key that is pressed continuasly
