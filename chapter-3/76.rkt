#lang sicp
(#%require "streams.rkt")
(#%require "helpers.rkt")

; empty-stream => empty stream
; 1 element => 1 element
; 2+ elements => average consecutive elements
(define (smooth stream)
  (define (iter first rest)
    (if (stream-null? rest)
      (cons-stream first the-empty-stream)
      (cons-stream
        (avg first (stream-car rest))
        (iter (stream-car rest) (stream-cdr rest)))))

  (if (stream-null? stream)
    the-empty-stream
    (iter (stream-car stream) (stream-cdr stream))))

(define (sign-change-detector a b)
  (cond
    ((and (< a 0) (>= b 0)) 1)
    ((and (>= a 0) (< b 0)) -1)
    (else 0)))

(define (make-zero-crossings stream)
  (define (iter stream last-value)
    (cons-stream
      (sign-change-detector last-value (stream-car stream))
      (iter (stream-cdr stream) (stream-car stream))))
  (iter (smooth stream) 0))

(define sense-data (list-to-stream (list 1 0.5 -23.1 0.2 -0.1 3)))
(puts (stream-slice (make-zero-crossings sense-data)  4))
