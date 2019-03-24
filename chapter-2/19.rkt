#lang sicp

(define us-coins (list 50 25 10 5 1))
(define us-coins2 (list 1 25 10 5 50))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (no-more? coin-values)) 0)
    (else (+
      (cc amount (except-first coin-values))
      (cc (- amount (first coin-values)) coin-values)))))

(define (no-more? x) (null? x))
(define (first x) (car x))
(define (except-first x) (cdr x))

(cc 100 us-coins)
(cc 100 us-coins2)
; Intuitively if cc correctly counts the number of ways one can change money,
; then the answers shouldn't be dependent on the order of coins list.

(cc 100 uk-coins)
