#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

(define (merge-weighted x y weight)
  (cond
    ((stream-null? x) y)
    ((stream-null? y) x)
    (else (let
      ((xcar (stream-car x))
      (ycar (stream-car y))
      (xw (weight (stream-car x)))
      (yw (weight (stream-car y))))
      (cond
        ((< xw yw)
          (cons-stream xcar (merge-weighted (stream-cdr x) y weight)))
        ((> xw yw)
          (cons-stream ycar (merge-weighted x (stream-cdr y) weight)))
        (else
          (cons-stream xcar (cons-stream
            ycar
            (merge-weighted (stream-cdr x) (stream-cdr y) weight)))))))))

(define (pairs s t weight)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

(define ramanujan-numbers
  (let ((weight (lambda (x) (+ (cube (car x)) (cube (cadr x))))))
    (define candidates (pairs integers integers weight))
    (define (iter s)
      (let
        ((first (stream-car s))
         (second (stream-car (stream-cdr s))))
        (if (= (weight first) (weight second))
          (cons-stream (weight first) (iter (stream-cdr (stream-cdr s))))
          (iter (stream-cdr s)))))
  (iter candidates)))

(define rn ramanujan-numbers)

(puts (stream-slice rn 6))
