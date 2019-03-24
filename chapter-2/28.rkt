#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (fringe x)
  (define (iter tmp result)
    (cond
      ((null? tmp) result)
      ((not (pair? tmp)) (cons tmp result))
      (else (iter (car tmp) (iter (cdr tmp) result)))))
  (iter x '()))

(display (fringe x))
