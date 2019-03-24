#lang sicp

; also solved in the previous exercise

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (id x) x)
(define (double x) (* x 2))

(sum id 1 (lambda (x) (+ 1 x)) 0) ; 0
(sum id 1 (lambda (x) (+ 1 x)) 1) ; 1
(sum id 1 (lambda (x) (+ 1 x)) 2) ; 3
(sum id 1 (lambda (x) (+ 1 x)) 10) ; 55
(newline)
(sum double 1 (lambda (x) (+ 1 x)) 0) ; 0
(sum double 1 (lambda (x) (+ 1 x)) 1) ; 1
(sum double 1 (lambda (x) (+ 1 x)) 2) ; 3
(sum double 1 (lambda (x) (+ 1 x)) 10) ; 55
