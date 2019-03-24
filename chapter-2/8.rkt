#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (sub-interval a b)
  (make-interval
    (- (lower-bound a) (upper-bound b))
    (- (upper-bound a) (lower-bound b))))
