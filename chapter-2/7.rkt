#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(lower-bound (make-interval -4 2))
(upper-bound (make-interval -4 2))
(upper-bound (make-interval 1 1))
(lower-bound (make-interval 1 1))
