#lang sicp

(define (make-vect x y) (cons x y))
(define (make-segment v1 v2) (cons v1 v2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define seg (make-segment (make-vect 1 2) (make-vect 2 4)))
(display seg)
(newline)
(display (start-segment seg))
(newline)
(display (end-segment seg))
