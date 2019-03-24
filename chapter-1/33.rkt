#lang sicp

(define (filtered-accumulate combiner null-value term next filter a b)
  (define (iter result index)
    (if (> index b)
      result
      (iter (combiner
        result
        (if (filter index) (term index) null-value))
        (next index))))
  (iter null-value a))

; a sum of the squares of the primes in the interval a to b
(define (smallest-divisor n)
  (define (divides? a b) (= 0 (remainder a b)))
  (define (next d) (if (= d 2) 3 (+ d 2)))
  (define (find-divisor d)
    (cond
      ((< n (* d d)) n)
      ((divides? n d) d)
      (else (find-divisor (next d)))))
  (find-divisor 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (id x) x)

(define (prime-squares a b)
  (filtered-accumulate + 0 square inc prime? a b))

(prime-squares 2 3)
(prime-squares 2 4)

; product of all positive integers less than n that are relatively prime to n

(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

(define (relative-primes-product n)
  (define (relative-prime? x) (= 1 (gcd x n)))
  (filtered-accumulate * 1 id inc relative-prime? 1 n))

(relative-primes-product 5)
