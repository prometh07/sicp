#lang sicp

(define (or-gate in in2 out)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal in) (get-signal in2))))
      (after-delay or-gate-delay (lambda () (set-signal! out new-value)))
      (add-action! in or-action-procedure)
      (add-action! in2 or-action-procedure)
      'ok)))
