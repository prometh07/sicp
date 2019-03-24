#lang sicp

(define (append a b)
  (if (null? a)
    b
    (cons (car a) (append (cdr a) b))))

(define (reverse x)
  (if (null? x)
    nil
    (append (reverse (cdr x)) (list (car x)))))

(reverse (list 1))
(reverse (list 1 2 3 4))
(reverse (list 1 4 9 16 25))

(define (reverse-iterative x)
  (define (iter tmp result)
    (if (null? tmp)
      result
      (iter (cdr tmp) (cons (car tmp) result))))
  (iter x (list )))

(reverse-iterative (list 1))
(reverse-iterative (list 1 2 3 4))
