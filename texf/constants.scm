(define-module (texf constants))

(use-modules (ice-9 textual-ports))

(define NIL '())

(define log-file (open-file "log.txt" "w"))

(define (logger str)
  (display str log-file))

(export NIL
        logger)
