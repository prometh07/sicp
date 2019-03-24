#lang sicp

(define (f g) (g 2))

(f (lambda (x) x))
(f f)
; error
; first, evaluate the body of procedure
; (g 2)
; then substitute g with f
; (f 2)
; (g 2)
; (2 2) ? -> error
