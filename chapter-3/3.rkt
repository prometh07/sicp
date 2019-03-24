#lang sicp

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
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE_ACCOUNT" m))))
  dispatch)

(define acc (make-account 100 'secret))
((acc 'test 'withdraw) 40)
((acc 'secret 'withdraw) 40)
