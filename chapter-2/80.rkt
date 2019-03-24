#lang sicp

(define (=zero? x)
  (apply-generic '=zero? x))

; for scheme-numbers use (= 0 x)
; for complex numbers check if both imag and real parts are zero
; for rational numbers check if numerator is equal to zero
