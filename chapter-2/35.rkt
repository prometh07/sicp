#lang sicp

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (accumulate op init (cdr seq)))))

(define (count-leaves t)
  (accumulate
    (lambda (subtree-leaves acc) (+ subtree-leaves acc))
    0
    (map (lambda (subtree)
      (if (pair? subtree)
        (count-leaves subtree)
        1)) t)))

(define t (list (list 1 2) (list 3 4)))

(count-leaves (list))
(count-leaves t)
(count-leaves (list t t))
