#lang sicp

(define (make-from-mag-ang x y)
  (lambda (op)
    (cond
      ((eq? op 'magnitude) x)
      ((eq? op 'angle) y)
      ((eq? op 'real-part) (* x (cos y)))
      ((eq? op 'imag-part) (* x (sin y)))
      (else "error - unknown operation"))))


((make-from-mag-ang 2 6) 'magnitude)
