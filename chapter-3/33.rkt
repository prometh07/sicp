#lang sicp

(define (make-connector)
  (let ((value #f) (informant #f) (constraints '()))
    (define (set-value val setter)
      (cond
        ((not (has-value? me))
          (set! value val)
          (set! informant setter)
          (for-each-except setter inform-about-value constraints))
        ((not (= value val))
          (error "contradiction" (list value val)))
        (else 'ignored)))
    (define (forget-value retractor)
      (if (eq? informant retractor)
        (begin
          (set! informant #f)
          (for-each-except retractor inform-about-no-value constraints))
        'ignored))
    (define (connect new-constraint)
      (if (not (memq new-constraint constraints))
        (set! constraints (cons new-constraint constraints)))
      (if (has-value? me)
        (inform-about-value new-constraint))
      'done)
    (define (me req)
      (cond
        ((eq? req 'has-value?)
          (if informant #t #f))
        ((eq? req 'value) value)
        ((eq? req 'set-value!) set-value)
        ((eq? req 'forget) forget-value)
        ((eq? req 'connect) connect)
        (else (error "Unknown operation -- CONNECTOR" req))))
    me))

(define (for-each-except exception proc list)
  (define (loop items)
    (cond
      ((null? items) 'done)
      ((eq? (car items) exception) (loop (cdr items)))
      (else
        (proc (car items))
        (loop (cdr items)))))
  (loop list))

(define (has-value? connector)
  (connector 'has-value?))

(define (get-value connector)
  (connector 'value))

(define (set-value! connector val informant)
  ((connector 'set-value!) val informant))

(define (forget-value! connector retractor)
  ((connector 'forget) retractor))

(define (connect connector new-constraint)
  ((connector 'connect) new-constraint))

(define (inform-about-value c)
  (c 'I-have-a-value))

(define (inform-about-no-value c)
  (c 'I-lost-my-value))

(define (averager a b c)
  (define (avg x y) (/ (+ x y) 2))
  (define (process-new-value)
    (cond
      ((and (has-value? a) (has-value? b))
        (set-value! c (avg (get-value a) (get-value b)) me))
      ((and (has-value? a) (has-value? c))
        (set-value! b (- (* 2 (get-value c)) (get-value a)) me))
      ((and (has-value? b) (has-value? c))
        (set-value! a (- (* 2 (get-value c)) (get-value b)) me))))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (forget-value! c me)
    (process-new-value))
  (define (me req)
    (cond
      ((eq? req 'I-have-a-value) (process-new-value))
      ((eq? req 'I-lost-my-value) (process-forget-value))
      (else (error "unknown request"))))
  (connect a me)
  (connect b me)
  (connect c me)
  me)

(define (probe name connector)
  (define (print-probe value)
    (newline)
    (display "Probe: ")
    (display name)
    (display " = ")
    (display value))
  (define (process-new-value)
    (print-probe (get-value connector)))
  (define (process-forget-value)
    (print-probe "?"))
  (define (me req)
    (cond
      ((eq? req 'I-have-a-value) (process-new-value))
      ((eq? req 'I-lost-my-value) (process-forget-value))))
  (connect connector me)
  me)

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))
(define avg (averager a b c))
(probe "a" a)
(probe "b" b)
(probe "c" c)

(set-value! a 1 'user)
(set-value! b 2 'user)
(forget-value! b 'user)
(set-value! c 10 'user)

; this one does not use previously defined primitives such as adder or multiplier
