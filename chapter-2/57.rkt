#lang sicp
(#%require "helpers.rkt")

(define (=number? x y)
  (and (number? x) (= x y)))

(define (variable? x) (symbol? x))

(define (same-variable? x y) (eq? x y))

; this one is maybe bad
; http://www.billthelizard.com/2012/04/sicp-256-258-symbolic-differentiation.html
(define (make-sum . args)
  (define (simplify x y)
    (cond
      ((=number? y 0) x)
      ((=number? x 0) y)
      ((and (number? x) (number? y)) (+ x y))
      (else (list '+ x y))))
  (cond
    ((= (length args) 1) (car args))
    ((= (length args) 2) (apply simplify args))
    (else (append (list '+) args))))

(define (make-product . args)
  (define (simplify x y)
    (cond
      ((or (=number? x 0) (=number? y 0)) 0)
      ((=number? x 1) y)
      ((=number? y 1) x)
      ((and (number? x) (number? y)) (* x y))
      (else (list '* x y))))
  (cond
    ((= (length args) 1) (car args))
    ((= (length args) 2) (apply simplify args))
    (else (append (list '*) args))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (addend x) (cadr x))

(define (augend x) (apply make-sum (cddr x)))

(define (multiplier x) (cadr x))

(define (multiplicand x) (apply make-product (cddr x)))

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

(log (deriv '(* (* x y) (+ x 3)) 'x))
(log (deriv '(* x y (+ x 3)) 'x))
