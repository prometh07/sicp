#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream-car s1) (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (interleave
      (interleave
        (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
        (stream-map (lambda (x) (list x (stream-car t))) (stream-cdr s)))
        (pairs (stream-cdr s) (stream-cdr t)))))

(define (triplets s t u)
  (cons-stream
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (x) (list (stream-car s) (car x) (cadr x))) (stream-cdr (pairs t u)))
      (triplets (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythagorean-triples
  (stream-filter
    (lambda (x) (= (square (caddr x)) (+ (square (car x)) (square (cadr x)))))
    (triplets integers integers integers)))

(puts (stream-slice pythagorean-triples 5))
