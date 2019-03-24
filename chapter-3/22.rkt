#lang sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr front-ptr))
    (define (insert-queue! x)
      (let ((new-pair (cons x '())))
        (cond
          ((null? front-ptr)
            (set! front-ptr new-pair)
            (set! rear-ptr new-pair)
            dispatch)
          (else
            (set-cdr! rear-ptr new-pair)
            (set! rear-ptr new-pair)
            dispatch))))
    (define (delete-queue!)
      (cond
        ((null? front-ptr) (error "DELETE! called with an empty queue"))
        (else
          (set! front-ptr (cdr front-ptr))
          dispatch)))
    (define (dispatch m)
      (cond
        ((eq? m 'front-ptr) front-ptr)
        ((eq? m 'rear-ptr) rear-ptr)
        ((eq? m 'insert-queue!) insert-queue!)
        ((eq? m 'delete-queue!) (delete-queue!))))
  dispatch))

(define (front-ptr q) (q 'front-ptr))
(define (delete-queue! q) (q 'delete-queue!))
(define (insert-queue! q x) ((q 'insert-queue!) x))

(define (print-queue q)
  (display (front-ptr q))
  (newline))

(define q1 (make-queue))
(print-queue q1)
(print-queue (insert-queue! q1 'a))
(print-queue (insert-queue! q1 'b))
(print-queue (delete-queue! q1))
(print-queue (delete-queue! q1))
