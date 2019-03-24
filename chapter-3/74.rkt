#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (sign-change-detector a b)
  (cond
    ((and (< a 0) (>= b 0)) 1)
    ((and (>= a 0) (< b 0)) -1)
    (else 0)))

(define sense-data (list-to-stream (list 1 0.5 -0.1 0.2 -0.1 3)))

; approximately equivalent - that is, we omit the first zero
(define zero-crossings
  (stream-map sign-change-detector sense-data (stream-cdr sense-data)))

(puts (stream-slice zero-crossings 4))
