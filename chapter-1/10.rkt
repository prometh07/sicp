#lang sicp

; Ackermann function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; f(n) = 2n for n > 0
(define (f n) (A 0 n))
(f 0)
(f 1)
(f 2)
(f 3)
(f 10)
(display "---\n")

; g(n) = 2^n for n > 0
(define (g n) (A 1 n))
(g 0)
(g 1)
(g 2)
(g 3)
(g 4)
(display "---\n")

; h(n) = 2^(2^(n-1)) for n > 0
(define (h n) (A 2 n))
(h 0) ; 0
(h 1) ; 2^1
(h 2) ; 2^2
(h 3)
(h 4)
