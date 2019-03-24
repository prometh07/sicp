#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (interleave
    (stream-map (lambda (x) (list (stream-car s) x)) t)
    (pairs (stream-cdr s) (stream-cdr t))))

; infinite loop as there's no delayed evaluation here

(define p (pairs integers integers))
(puts (stream-slice p 1))
