#lang sicp

; iterative process
(define (accumulate combiner null-value term next a b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term next (next a) b))))

(define (id x) x)
(define (inc x) (+ x 1))

(define (sum a b)
  (accumulate + 0 id inc a b))

(define (product a b)
  (accumulate * 1 id inc a b))

(sum 1 10)
(product 1 5)

; recursive process
(define (accumulate-recursive combiner null-value term next a b)
  (define (iter result index)
    (if (> index b)
      result
      (iter (combiner result (term index)) (next index))))
  (iter null-value a))

(define (product-recursive a b)
  (accumulate-recursive * 1 id inc a b))

(define (sum-recursive a b)
  (accumulate-recursive + 0 id inc a b))

(sum-recursive 1 10)
(product-recursive 1 5)
