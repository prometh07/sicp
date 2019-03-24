#lang sicp
(#%require "helpers.rkt")

(define (union-set x y)
  (cond
    ((null? x) y)
    ((null? y) x)
    ((< (car x) (car y)) (cons (car x) (union-set (cdr x) y)))
    ((= (car x) (car y)) (cons (car x) (union-set (cdr x) (cdr y))))
    ((> (car x) (car y)) (cons (car y) (union-set x (cdr y))))))

(log (union-set nil nil))
(log (union-set (list 1) nil))
(log (union-set (list 0) (list 1)))
(log (union-set (list 1) (list 0)))
(log (union-set (list 1) (list 1)))
(log (union-set (list 0 2 4) (list 1 3)))
(log (union-set (list 0 2 4) (list 0 1 2 3 4 5)))
