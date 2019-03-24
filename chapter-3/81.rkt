#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (rand-update x) (+ x 1))
(define random-init 0)

(define (rand requests)
  (define (iter prev requests)
    (cond
      ((stream-null? requests)
        the-empty-stream)
      ((integer? (stream-car requests))
        (cons-stream (stream-car requests) (iter (stream-car requests) (stream-cdr requests))))
      (else
        (cons-stream (rand-update prev) (iter (rand-update prev) (stream-cdr requests))))))
  (iter random-init requests))

(define requests (list-to-stream '(n n n 0 n n n)))
(puts (stream-slice (rand requests) 7))
