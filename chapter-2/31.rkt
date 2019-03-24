#lang sicp

(define (tree-map fn t)
  (map (lambda (subtree)
    (if (number? subtree)
      (fn subtree)
      (tree-map fn subtree))) t))

(define (square-tree t) (tree-map (lambda (x) (* x x)) t))

(define t (list
  1
  (list
    2
    (list 3 4)
    5)
  (list 6 7)))

(display (square-tree t))
(newline)
