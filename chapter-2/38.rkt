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

(fold-right / 1 (list 1 2 3)) ; 3/2
(fold-left / 1 (list 1 2 3)) ; 1/6
(display (fold-right list nil (list 1 2 3))) ; (1 (2 (3)))
(newline)
(display (fold-left list nil (list 1 2 3))) ; (((() 1) 2) 3)
(newline)
(fold-left min 1000 (list 1 2 3))
(fold-right min 1000 (list 1 2 3))

; commutativity?????- eg. addition or multuplication, not subtraction or division
