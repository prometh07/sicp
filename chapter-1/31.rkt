#lang sicp

; iterative process, tail-optimized recursion calls
(define (product-iterative fn a b step)
  (define (iter result index)
    (if (> index b)
      result
      (iter (* result (fn index)) (step index))))
  (iter 1 a))

(define (id x) x)
(define (square x) (* x x))

(define (factorial n)
  (product-iterative id 1 n (lambda (x) (+ 1 x))))

(factorial 0)
(factorial 1)
(factorial 2)
(factorial 5)

(define (pi-approx n)
  (define (limit x) (+ x (* 2 (- n 1))))
  (define (step x) (+ x 2))
  (/ (* 8.0 (product-iterative square 4 (limit 4) step))
     (* (limit 4) (product-iterative square 3 (limit 3) step))))

; it quite works until we reach 100 steps (then we get infinity due to large product results), but is terrible
; a much better solution can be seen in J. Weirich repository eg.:
; for every element d of denominator we have a (d-1)*(d+1) in a numerator,
; then we increase d by 2

(pi-approx 10)
(pi-approx 20)
(pi-approx 40)
(pi-approx 60)
(pi-approx 80)

; b - recursive product process

(define (product-recursive fn a b step)
  (if (> a b)
    1
    (* (fn a) (product-recursive fn (step a) b step))))

(define (factorial-recursive n)
  (product-recursive id 1 n (lambda (x) (+ x 1))))

(factorial-recursive 0)
(factorial-recursive 1)
(factorial-recursive 2)
(factorial-recursive 5)
