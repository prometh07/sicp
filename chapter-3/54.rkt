#lang sicp
(#%require "streams.rkt")

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define factorials
  (cons-stream 1 (mul-streams integers factorials)))

(display (stream-slice factorials 4)) ; <0!, 1!, 2!, 3!>
