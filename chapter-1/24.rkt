#lang sicp

(define (square x) (* x x))

(define (even? n) (= 0 (remainder n 2)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) (report-prime n (- (runtime) start-time))))

(define (report-prime prime elapsed-time)
  (display prime)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (prime? n)
  (fast-prime? n 4))

(define (expmod base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (iter a)
    (= (expmod a n n) a))
  (iter (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond
    ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

(define (search-for-primes min max)
  (define (iter counter)
    (cond
      ((< counter max) (timed-prime-test counter) (iter (+ counter 2)))
      (else (newline))))
  (iter (if (even? min) (+ 1 min) min)))

(search-for-primes 970 1020)
(search-for-primes 10000 10050)
(search-for-primes 100000 100050)
(search-for-primes 1000000 1000050)

; logarithmic complexity - times are more or less the same
; the only exception - the first prime found (no matter in what range) - why?
