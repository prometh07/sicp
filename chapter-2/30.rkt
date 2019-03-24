#lang sicp

(define t (list
  1
  (list
    2
    (list 3 4)
    5)
  (list 6 7)))

(define (square x) (* x x))

(define (square-tree t)
  (cond
    ((null? t) t)
    ((pair? t) (cons (square-tree (car t)) (square-tree (cdr t))))
    (else (square t))))

(define (square-map t)
  (map (lambda (subtree)
    (if (number? subtree)
      (square subtree)
      (square-map subtree))) t))

(display (square-tree t))
(newline)
(display (square-map t))
(newline)
