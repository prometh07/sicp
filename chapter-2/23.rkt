#lang sicp

(define (for-each fn x)
  (cond ((not (null? x)) (fn (car x)) (for-each fn (cdr x)))))

(for-each (lambda (x) (display x) (newline)) (list 1 2 3 4))
