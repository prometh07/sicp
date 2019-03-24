#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
      (add-streams (scale-stream integrand dt) int)))
  int)

(define (RC R C dt)
  (define (iter current initial-voltage)
    (define Ri (scale-stream current R))
    (define int (integral (scale-stream current (/ 1.0 C)) initial-voltage dt))
    (add-streams Ri int))
  iter)

(define RC1 (RC 5 1 0.5))

(puts (stream-slice (RC1 integers 0.2a) 5))
