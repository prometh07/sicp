#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (reverse x)
  (define (iter tmp result)
    (if (null? tmp) result (iter (cdr tmp) (cons (car tmp) result))))
  (iter x '()))

(define (deep-reverse x)
  (define (iter tmp result)
    (if (null? tmp) result (iter (cdr tmp) (cons (deep-reverse (car tmp)) result))))
  (if (not (pair? x)) x (iter x '())))

(display (reverse x))
(newline)
(display (deep-reverse x))
(newline)
