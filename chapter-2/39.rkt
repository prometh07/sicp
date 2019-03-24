#lang sicp

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (fold-right op init (cdr seq)))))

(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq))

(define (reverse2 seq)
  (fold-left (lambda (x y) (cons y x)) nil seq))

(display (reverse (list 1 2 3)))
(newline)
(display (reverse2 (list 1 2 3)))
