#lang sicp


(define (make-rat x y)
  (define g (gcd x y))
  (define negative? (< (* x y) 0))
  (cons (/ (if negative? (- (abs x)) (abs x)) g) (abs (/ y g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(print-rat (make-rat 2 4))
(print-rat (make-rat -2 -4))
(print-rat (make-rat 0 -4))
(print-rat (make-rat 0  4))
(print-rat (make-rat -2 4))
(print-rat (make-rat 2 -4))
