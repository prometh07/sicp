#lang racket/base

(define (sq x) (* x x))
(define (sum x y) (+ (sq x) (sq y)))
(define (fn a b c) (if (> a b)
  (if (> b c) (sum a b) (sum a c))
  (if (> a c) (sum a b) (sum c b))
))

(fn 1 2 3)
(fn 3 2 1)
(fn 3 1 2)
(fn 1 1 1)
