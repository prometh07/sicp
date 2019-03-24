#lang sicp

(define (cons x y)
  (lambda (f) (f x y)))

(define (car x)
  (x (lambda (p q) p)))

(define (cdr x)
  (x (lambda (p q) q)))

(car (cons 1 2))
(cdr (cons 1 2))

; (car (cons x y))
; (car (lambda (f) (f x y)))
; (x (lambda (p q) p)) ; body of car, now replace x with real arg val
; ((lambda (f) (f x y)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; x
