#lang sicp
(#%require "helpers.rkt")

(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((equal? (car set) x) true)
    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set) set (cons x set)))

(define (union-set x y)
  (if (null? x)
    y
    (union-set
      (cdr x)
      (adjoin-set (car x) y))))

(log (union-set (list 1 5 2 3) (list 1 3 4)))
(log (union-set (list 1 3 4) (list 1 5 2 3)))
(log (union-set (list 1) (list )))
(log (union-set (list ) (list 1)))
(log (union-set (list ) (list )))

(log (map (lambda (x) (+ x 1)) (list 1 2 3)))
