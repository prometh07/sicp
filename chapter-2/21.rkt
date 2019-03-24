#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items)) (square-list (cdr items)))))

(define (square-map x)
  (map square x))

(square-list (list 1 2 3 4))
(square-map (list 1 2 3 4))