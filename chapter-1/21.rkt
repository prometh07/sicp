#lang sicp

(define (smallest-divisor n)
  (define (divides? a b) (= 0 (remainder a b)))
  (define (find-divisor d)
    (cond
      ((< n (* d d)) n)
      ((divides? n d) d)
      (else (find-divisor (+ 1 d)))))
  (find-divisor 2))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
