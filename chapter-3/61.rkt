#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (invert-unit-series s)
  (cons-stream 1 (negate (mul-series (stream-cdr s) (invert-unit-series s)))))

(puts (stream-slice (invert-unit-series exp-series) 15))
