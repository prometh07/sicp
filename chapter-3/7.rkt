#lang sicp
(#%require "helpers.rkt")

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
        balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (wrong-password? pwd)
    (not (eq? pwd password)))
  (define wrong-password-fn
    (lambda (x . args) "Wrong password"))
  (define (dispatch pwd m)
    (cond
      ((wrong-password? pwd) wrong-password-fn)
      ((eq? m 'balance) (withdraw 0))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE_ACCOUNT" m))))
  dispatch)

(define acc (make-account 100 'secret))

(define (make-joint acc pwd new-pwd)
  (if (number? ((acc pwd 'withdraw) 0))
    (lambda (p m) (acc (if (eq? p new-pwd) pwd p) m))
    (error "Wrong password used when creating a joint account.")
  ))

(define acc2 (make-joint acc 'secret 'test))

(log ((acc2 'tst 'withdraw) 10))
(log ((acc2 'test 'withdraw) 10))
(log (acc 'secret 'balance))
(log ((acc 'secret 'withdraw) 40))
(log (acc2 'test 'balance))
