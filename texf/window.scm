(use-modules (srfi srfi-9))


;; Most basic type of View. Area upon which text can be placed.
(define-record-type WindowInfo
  (make-window-info lines cols type read-write)
  window-info?
  (lines window-info-lines)
  (cols window-info-cols)
  (type window-info-type)
  (read-write window-info-read-write))

(export make-window-info
        window-info?
        window-info-lines
        window-info-cols
        window-info-type
        window-info-read-write)
