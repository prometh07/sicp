#lang sicp

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) (report-prime n (- (runtime) start-time))))

(define (report-prime prime elapsed-time)
  (display prime)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (smallest-divisor n)
  (define (divides? a b) (= 0 (remainder a b)))
  (define (next d) (if (= d 2) 3 (+ d 2)))
  ;(define (next d) (+ 1 d))
  (define (find-divisor d)
    (cond
      ((< n (* d d)) n)
      ((divides? n d) d)
      (else (find-divisor (next d)))))
  (find-divisor 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes min max)
  (define (even? n) (= 0 (remainder n 2)))
  (define (iter counter)
    (cond
      ((< counter max) (timed-prime-test counter) (iter (+ counter 2)))
      (else (newline))))
  (iter (if (even? min) (+ 1 min) min)))

(search-for-primes 1000 1020) ; 1 ms
(search-for-primes 10000 10050) ; 3 ms
(search-for-primes 100000 100050) ; 6-9 ms
(search-for-primes 1000000 1000050) ; 19-25 ms

; more or less 2 times faster, because we avoid all the even divisors
