(define-module (texf))

;; Imports
(use-modules (ncurses curses)
             (ice-9 textual-ports)) ;; read strings from ports

(define LOG (open-file "log.txt" "w"))

;; texf imports
(use-modules (texf text)
             (texf state)
             (texf normal)
             (texf constants)
             (texf buffer))


(define (main-loop state screen)
  (if (state-quit? state)
    (state-quit! state)
    (let ((new-state (process-keypress screen state)))
      (begin (draw-state state screen)
             (main-loop state screen)))))

(define (texf-main args)
  (let ((file-port (open-file (list-ref args 1) "r")))
    (begin (define stdscr (initscr))
           (define bf (load-buffer-object file-port))
           (define screen-lines (lines))
           (define screen-columns (cols))
           ;; (define buffer-lines (string-split text #\newline))
           (define slices (slice (buffer-text bf) 0 screen-lines))
           (define state (make-state (list bf) normal-mode NIL))
           (define final-state (main-loop state stdscr))
           (getch stdscr)
           (endwin))))

;; (define (texf-main args)
;;   (let ((buffer-port (open-file (list-ref args 1) "r")))
;;       (begin (define stdscr (initscr))
;;              (define screen-lines (lines))
;;              (display lines)
;;              (define text (get-string-all buffer-port))
;;              (define buffer-lines (string-split text #\newline))
;;              (define slices (slice buffer-lines 0 screen-lines))
;;              (display slices LOG)
;;              (draw-on-screen stdscr slices)
;;              (addstr stdscr (get-string-all buffer-port))
;;              (refresh stdscr)
;;              (getch stdscr)
;;              (endwin))))

(define (start-texf config)
  (display "Starting Texf Editor")
  (display config)
  (newline))

(export texf-main)
