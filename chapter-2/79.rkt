#lang sicp

(define (equ? x y)
  (if (eq? (type-tag x) (type-tag y))
    (apply-generic 'equ? x y) ; or insert logic for supported types here
    #f))

; for scheme-number just use builtin =
; for rational numbers p/q, r/s check for (p == r) ^ (q == s) (for canonical representations)
; for complex numbers real and imag parts must be equal
