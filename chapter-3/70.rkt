#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (merge-weighted x y weight)
  (cond
    ((stream-null? x) y)
    ((stream-null? y) x)
    (else (let (
      (xcar (stream-car x))
      (ycar (stream-car y))
      (xw (weight (stream-car x)))
      (yw (weight (stream-car y))))
      (cond
        ((< xw yw)
          (cons-stream xcar (merge-weighted (stream-cdr x) y weight)))
        ((> xw yw)
          (cons-stream ycar (merge-weighted x (stream-cdr y) weight)))
        (else
          (cons-stream
            xcar
            (cons-stream
              ycar
              (merge-weighted (stream-cdr x) (stream-cdr y) weight)))))))))

(define (pairs s t weight)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

(define pairs-by-sum
  (pairs integers integers (lambda (x) (+ (car x) (cadr x)))))

(puts (stream-slice pairs-by-sum 10))

; b) (i, j): i <= j && (i, j not divisible by 2,3,5), ordered by 2i + 3j + 5ij
(define (f s) (stream-filter
  (lambda (x)
    (and
      (not (= (remainder x 2) 0))
      (not (= (remainder x 3) 0))
      (not (= (remainder x 5) 0))))
  s))

(define b-pairs (pairs
  (f integers)
  (f integers)
  (lambda (x) (+ (* 2 (car x)) (* 3 (cadr x)) (* 5 (car x) (cadr x))))))

(puts (stream-slice b-pairs 10))
