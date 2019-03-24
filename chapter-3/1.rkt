#lang sicp

(define (make-accumulator acc)
  (lambda (n) (begin
    (set! acc (+ acc n))
    acc)))

(define counter (make-accumulator 0))
(counter 1)
(counter 1)
(counter 1)
(counter 5)
