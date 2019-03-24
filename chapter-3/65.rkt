#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (summands n)
  (cons-stream
    (/ 1.0 n)
    (negate (summands (+ n 1)))))

(define (euler-transform s)
  (let
    ((s0 (stream-ref s 0))
     (s1 (stream-ref s 1))
     (s2 (stream-ref s 2)))
    (cons-stream
      (- s2 (/ (square (- s2 s1)) (+ s0 (* -2 s1) s2)))
      (euler-transform (stream-cdr s)))))


(define ln2 (partial-sums (summands 1)))
(define faster-ln2 (euler-transform ln2))

(puts (stream-slice ln2 10))
(puts (stream-slice faster-ln2 10))

; one can as well use the make-tableau procedure to converge series even faster,
; to check the speed of convergence we can modify stream-limit procedure to
; return index instead of value
