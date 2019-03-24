#lang sicp
(#%require "helpers.rkt")

(define (=number? x y)
  (and (number? x) (= x y)))
(define (variable? x) (symbol? x))
(define (same-variable? x y) (eq? x y))
(define (make-sum x y)
  (cond
    ((=number? y 0) x)
    ((=number? x 0) y)
    ((and (number? x) (number? y)) (+ x y))
    (else (list x '+ y))))
(define (make-product x y)
  (cond
    ((or (=number? x 0) (=number? y 0)) 0)
    ((=number? x 1) y)
    ((=number? y 1) x)
    ((and (number? x) (number? y)) (* x y))
    (else (list x '* y))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (addend x) (car x))
(define (augend x) (caddr x))
(define (multiplier x) (car x))
(define (multiplicand x) (caddr x))

(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp)
      (if (same-variable? exp var) 1 0))
    ((sum? exp)
      (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
    ((product? exp)
      (make-sum
        (make-product (multiplier exp) (deriv (multiplicand exp) var))
        (make-product (multiplicand exp) (deriv (multiplier exp) var))))
    (else
      (error "unknown expression type -- DERIV" exp))))

; a
(log (deriv '(x * (3 + x)) 'x))
(log (deriv '(x + (3 * (x + (y + 2)))) 'x))
(log (deriv '(x + 3) 'x))

; b
