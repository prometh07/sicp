#lang sicp

(define (mul a b)
  (define (double x) (* x 2))
  (define (halve x) (/ x 2))
  (define (even? x) (= 0 (remainder x 2)))
  (define (iter a b c)
    (cond
      ((= a 0) c)
      ((even? a) (iter (halve a) (double b) c))
      (else (iter (- a 1) b (+ c b)))))
  (iter a b 0))

(mul 2 0)
(mul 2 1)
(mul 2 2)
(mul 2 3)

; it's a better (tail-recursive) version of a solution to exercise 1.17,
; which is analogous to the fast-exp procedure from the book
