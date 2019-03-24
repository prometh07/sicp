#lang sicp

(define f (let ((prev nil))
  (lambda (x)
    (if (eq? prev 0)
      0
      (begin (set! prev x) x)))))


(+ (f 0) (f 1))
;(+ (f 1) (f 0))
