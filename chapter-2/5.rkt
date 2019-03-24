#lang sicp

(define (square x) (* x x))

(define (exp b n)
  (cond
    ((= n 0) 1)
    ((even? n) (square (exp b (/ n 2))))
    (else (* b (exp b (- n 1))))))

(define (cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (get-exponent number base)
  (define (iter tmp exponent)
    (if (= 0 (remainder tmp base))
      (iter (/ tmp base) (+ exponent 1))
      exponent))
  (iter number 0))

(define (car x) (get-exponent x 2))
(define (cdr x) (get-exponent x 3))

(car (cons 0 0))
(car (cons 4 3))
(cdr (cons 4 3))
