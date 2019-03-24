#lang sicp
(#%require "streams.rkt")

(define (partial-sums s)
  (define tmp (cons-stream (stream-car s) (add-streams tmp (stream-cdr s))))
  tmp)

(define (partial-sums2 s)
  (cons-stream (stream-car s) (add-streams (stream-cdr s) (partial-sums2 s))))

(display (stream-slice (partial-sums integers) 4))
(display (stream-slice (partial-sums2 integers) 4))
