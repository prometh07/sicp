#lang sicp

(define (exp b n)
  (define (iter b n a)
    (define (even? x) (= (remainder x 2) 0))
    (cond
      ((= n 0) a)
      ((even? n) (iter (* b b) (/ n 2) a))
      (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

(exp 2 0)
(exp 2 1)
(exp 2 2)
(exp 2 3)
