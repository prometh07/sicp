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

(sqrt 0.00001)
(square (sqrt 0.00001))

; when we try to compute a square root of a number lower than our epsilon,
; the results are innacurate
; errors for big numbers result from limited memory used to store numbers
