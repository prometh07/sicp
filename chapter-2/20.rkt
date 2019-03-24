#lang sicp

; this one creates a recursive process
; in order to create an iterative one, one might use either the iterative reverse
; procedure from ex. 2.18 or use the built-in reverse procedure

(define (same-parity head . tail)
  (define head-parity
    (if (even? head) even? odd?))
  (define (iter tmp)
    (cond
      ((null? tmp) nil)
      ((head-parity (car tmp)) (cons (car tmp) (iter (cdr tmp))))
      (else (iter (cdr tmp)))))
  (cons head (iter tail)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
