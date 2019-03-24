#lang sicp

(define (ripple-carry-adder a-list b-list s-list c-out)
  (define (last-bit? x)
    (and (null? (cdr x))))
  (define (iter a b s c)
    (cond
      ((null? a) 'ok)
      ((last-bit? a)
        (full-adder (car a) (car b) c (car s) c-out)
        (iter (cdr a) (cdr b) (cdr s) c-out))
      (else (let ((c-tmp (make-wire)))
        (full-adder (car a) (car b) c (car s) c-tmp)
        (iter (cdr a) (cdr b) (cdr s) c-tmp)))))
  (iter a-list b-list s-list (make-wire)))
