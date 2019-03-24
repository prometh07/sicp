#lang sicp

; show that golden ratio phi is a fixed point of
; the trasformation x -> x + 1/x

; Just take the function f(x) = x + 1/x and calculate its value
; for the golden ratio. It turns out that in this case f(x) = x too.


(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (golden-ratio guess)
  (fixed-point (lambda (x) (+ 1.0 (/ 1 x))) guess))

(define real-golden-ratio (/ (+ 1 (sqrt 5)) 2))

(golden-ratio 1)
real-golden-ratio
