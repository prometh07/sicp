#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 5)

; (double double)
; f(x) = double(double(x))
; (double f(x))
; double(double(double(double(x))))
; (((double (double double)) inc) 5) -> + 16

(((double (double double)) inc) 5)
