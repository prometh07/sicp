#lang sicp

(define (square x) (* x x))
(define (sqrt x) (sqrt-iter x 1.0))
(define (sqrt-iter x guess)
  (if (good-enough? x guess) ; or new-if
    guess
    (sqrt-iter x (improve-guess x guess))
  )
)
(define (good-enough? x guess)
  (< (abs (- x (square guess))) 0.001)
)
(define (improve-guess x guess) (avg guess (/ x guess)))
(define (avg x y) (/ (+ x y) 2))
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause) (else else-clause))
)

(sqrt 4)

; when using new-if, we get into an infinite loop. The reason for
; such a behaviour is the applicative evaluation order used by
; the interpeter. On the other side, the built-in if evaluates the else-clause
; only if a given predicate evaluates to false. Therefore, we stop execution
; when our guess becomes good enough.
