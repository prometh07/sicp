#lang sicp

(define (make-queue) (cons '() '()))

(define (rear-ptr q) (cdr q))

(define (front-ptr q) (car q))

(define (set-front-ptr! q x) (set-car! q x))

(define (set-rear-ptr! q x) (set-cdr! q x))

(define (empty-queue? q) (null? (front-ptr q)))

(define (insert-queue! q item)
  (let ((new-pair (cons item '())))
    (cond
      ((empty-queue? q)
        (set-front-ptr! q new-pair)
        (set-rear-ptr! q new-pair)
        q)
      (else
        (set-cdr! (rear-ptr q) new-pair)
        (set-rear-ptr! q new-pair)
        q))))

(define (delete-queue! q)
  (cond
    ((empty-queue? q) (error "DELETE! called with an empty queue" q))
    (else
      (set-front-ptr! q (cdr (front-ptr q)))
      q)))

(define (print-queue q)
  (display (front-ptr q))
  (newline))

(define q1 (make-queue))
(print-queue q1)
(print-queue (insert-queue! q1 'a))
(print-queue (insert-queue! q1 'b))
(print-queue (delete-queue! q1))
(print-queue (delete-queue! q1))
