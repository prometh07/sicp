#lang sicp

(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))
(define (add-vect v y)
  (make-vect
    (+ (xcor-vect v) (xcor-vect y))
    (+ (ycor-vect v) (ycor-vect y))))
(define (scale-vect v k)
  (make-vect
    (* k (xcor-vect v))
    (* k (ycor-vect v))))
(define (sub-vect v y)
  (add-vect v (scale-vect y -1)))

(define v (make-vect 2 -1))
(display (add-vect v v))
