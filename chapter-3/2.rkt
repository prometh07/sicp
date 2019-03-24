#lang sicp

(define (make-monitored f)
  (let ((counter 0))
    (lambda (x)
      (cond
        ((eq? x 'how-many-calls?) counter)
        ((eq? x 'reset-count) (set! counter 0))
        (else (begin
          (set! counter (+ 1 counter))
          (f x)))))))

(define s (make-monitored sqrt))
(s 100)
(s 25)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)
