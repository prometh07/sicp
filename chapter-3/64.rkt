#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (stream-limit s tolerance)
  (let ((second (stream-car (stream-cdr s))))
    (if (<= (abs (- (stream-car s) second)) tolerance)
      second
      (stream-limit (stream-cdr s) tolerance))))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
      (stream-map (lambda (guess) (sqrt-improve guess x)) guesses)))
  guesses)

(define (sqrt-improve guess x)
  (avg guess (/ x guess)))


(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 10 0.00001)
