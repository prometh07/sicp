#lang sicp

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons
      (accumulate op init (map car seqs))
      (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (transpose (map (lambda (col) (matrix-*-vector m col)) cols))))

(define m '((1 3) (4 0) (2 1)))
(define n '((4 6 1) (2 1 0)))

(display (matrix-*-matrix m n))
