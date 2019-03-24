#lang sicp

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (accumulate op init (cdr seq)))))

(define (horner-eval x coefficients)
  (accumulate (lambda (i acc) (+ i (* x acc))) 0 coefficients))

(horner-eval 2 (list 1 3 0 5 0 1))
