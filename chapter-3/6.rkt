#lang sicp
(#%require "helpers.rkt")

(define random-init 0)
(define (rand-update x) (+ x 1))

(define rand
  (let ((x random-init))
    (lambda (symbol) (cond
      ((eq? symbol 'generate)
        (set! x (rand-update x))
        x)
      ((eq? symbol 'reset)
        (lambda (new-value)
          (set! x new-value)
          x))))))

(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 0)
(rand 'generate)
(rand 'generate)
(rand 'generate)
