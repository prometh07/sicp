#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (integrate-series s)
  (define (iter stream denom)
    (cons-stream
      (/ (stream-car stream) denom)
      (iter (stream-cdr stream) (+ denom 1))))
  (iter s 1))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(puts (stream-slice exp-series 5))
(puts (cons 1 (stream-slice (integrate-series exp-series) 4))) ;

(define (negate s)
  (cons-stream (- (stream-car s)) (negate (stream-cdr s))))

(define cosine-series
  (cons-stream 1 (integrate-series (negate sine-series))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

(puts (stream-slice cosine-series 6))
(puts (stream-slice sine-series 6))
