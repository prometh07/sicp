#lang sicp

(define (cube x) (* x x x))
(define (square x) (* x x))
(define (cube-root x)
  (define (iter guess) (if (good-enough? guess) guess (iter (improve guess))))
  ;(define (good-enough? guess) (< (abs (- x (cube guess))) 0.001))
  (define (good-enough? guess) (< (abs (- x (cube guess))) (/ guess 100000)))
  (define (improve guess)
    (define denominator (+ (/ x (square guess)) (* 2 guess)))
    (/ denominator 3))
  (iter 1.0))

(cube-root 8)
(cube-root 1)
(cube-root 0.5)
