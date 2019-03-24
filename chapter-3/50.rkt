#lang sicp
(#%require "streams.rkt")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map (cons proc (map stream-cdr argstreams))))))

(define (double . s)
  (map (lambda (x) (* x 2)) s))

(define doubled (stream-map double (stream-enumerate-interval 1 5) (stream-enumerate-interval 6 10)))
(display-stream doubled)
