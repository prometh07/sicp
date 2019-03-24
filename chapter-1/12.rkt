#lang sicp

; a recursive procedure computing elements of Pascal's triangle given
; k-th row and n-th element in the row
(define (pascal k n)
  (define (iter k n)
    (if (or (= k 1) (= n 1) (= n k))
      1
      (+ (iter (- k 1) (- n 1)) (iter (- k 1) n))))
  (iter k n))

; a recursive procedure computing a Pascal triangle consisting of k rows
(define (pascal-triangle k)
  (define (iter row)
    (define (print col)
      (define elem (pascal row col))
      (cond ((> col row) (display "\n"))
            (else (display elem) (display " ") (print (+ col 1)))))
    (cond ((> row k) (display ""))
          (else (print 1) (iter (+ row 1)))))
  (iter 1))

(pascal-triangle 3)
