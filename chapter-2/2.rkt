#lang sicp

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment x y) (cons x y))
(define (start-segment p) (car p))
(define (end-segment p) (cdr p))

(define (midpoint p)
  (define (avg a b) (/ (+ a b) 2))
  (let
    ((mid-x (avg (x-point (start-segment p)) (x-point (end-segment p))))
    (mid-y (avg (y-point (start-segment p)) (y-point (end-segment p)))))
    (make-point mid-x mid-y)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(print-point (midpoint (make-segment (make-point 0 0) (make-point 0 0))))
(print-point (midpoint (make-segment (make-point 6 -6) (make-point -6 6))))
(print-point (midpoint (make-segment (make-point 1 1) (make-point 5 5))))
