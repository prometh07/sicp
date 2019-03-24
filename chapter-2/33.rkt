#lang sicp

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (accumulate op init (cdr seq)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (pp x) (display x) (newline))

(pp (map (lambda (x) (* x x)) (list 1 2 3)))

(define (append a b)
  (accumulate cons b a))

(pp (append (list 1 2 3) (list 4 5 6)))

(define (length a)
  (accumulate (lambda (x acc) (+ acc 1)) 0 a))

(pp (length (list 1 2)))
(pp (length (list)))
