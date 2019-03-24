#lang sicp

(define (equal? a b)
  (cond
    ((eq? a b) #t)
    ((and
      (pair? a)
      (pair? b)
      (equal? (car a) (car b)))
     (equal? (cdr a) (cdr b)))
    (else #f)))

(equal? 'a 'a)
(equal? '(this is a list) '(this is a list))
(equal? (list 1 2) (list 1 2))
(eq? 1 1)
(equal? '(this is a list) '(this (is a) list))
(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6))
(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6))
