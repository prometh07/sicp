#lang sicp

; recursive process
(define (rec-f n)
  (if (< n 3)
    n
    (+ (rec-f (- n 1)) (* 2 (rec-f (- n 2))) (* 3 (rec-f (- n 3))))))

(rec-f 2)
(rec-f 3)
(rec-f 4)
(rec-f 5)
(rec-f 6)

; iterative process
; todo
