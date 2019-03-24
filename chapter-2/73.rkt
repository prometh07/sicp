#lang sicp
(#%require "helpers.rkt")

; a)
; instead of manually listing specific procedures for different
; types of expressions we use a table/dictionary that allows
; us to map from a type to a procedure
; We can't use predicates because they evaluate to either true or false,
; resulting in an ambiguity. Also, how would one define operator or operands
; for numbers?

; b)

(define (deriv exp var)
  ; get is an artificial (generic-operation, data type) -> (specific operation) table substitute
  (define (get operation type)
    (cond
      ((eq? type '+) deriv-sum)
      ((eq? type '*) deriv-product)
      (else (error "unknown type"))))

  (define (=number? x y)
    (and (number? x) (= x y)))
  (define (variable? x) (symbol? x))
  (define (same-variable? x y) (eq? x y))
  (define (make-sum x y)
    (cond
      ((=number? y 0) x)
      ((=number? x 0) y)
      ((and (number? x) (number? y)) (+ x y))
      (else (list '+ x y))))
  (define (make-product x y)
    (cond
      ((or (=number? x 0) (=number? y 0)) 0)
      ((=number? x 1) y)
      ((=number? y 1) x)
      ((and (number? x) (number? y)) (* x y))
      (else (list '* x y))))
  (define (addend x) (car x))
  (define (augend x) (cadr x))
  (define (multiplier x) (car x))
  (define (multiplicand x) (cadr x))
  (define (operator exp) (car exp))
  (define (operands exp) (cdr exp))
  (define (deriv-sum exp var)
    (make-sum
      (deriv (addend exp) var)
      (deriv (augend exp) var)))
  (define (deriv-product exp var)
    (make-sum
      (make-product (multiplier exp) (deriv (multiplicand exp) var))
      (make-product (multiplicand exp) (deriv (multiplier exp) var))))

  (cond
    ((number? exp) 0)
    ((variable? exp) (if (same-variable? exp var) 1 0))
    (else ((get 'deriv (operator exp)) (operands exp) var))))

(log (deriv '(+ x 2) 'x))
(log (deriv '(* x y) 'x))
(log (deriv '(* (* x x) 3) 'x))

; in reality, those helper functions and the deriv function would be defined
; inside an install-deriv-package function similar to the one from the book;

; c)
; trivial - just define another rule inside the package and put it into
; the procedures storage using `put`

; d)
; just swap the order of variables passed to put
