#lang sicp
(#%require "helpers.rkt")

(define (make-deque) (cons '() '()))
(define (front q) (car q))
(define (rear q) (cdr q))
(define (set-front! q x) (set-car! q x))
(define (set-rear! q x) (set-cdr! q x))
(define (empty-deque? q) (null? (front q)))

(define (make-node val prev next) (list val prev next))
(define (val-node n) (car n))
(define (prev-node n) (cadr n))
(define (next-node n) (caddr n))
(define (single-node? n)
  (and
    (null? (prev-node n))
    (null? (next-node n))))
(define (set-next! n x) (set-car! (cddr n) x))
(define (set-prev! n x) (set-car! (cdr n) x))

(define (front-insert! q x)
  (let ((new-node (make-node x nil nil)))
    (cond
      ((empty-deque? q)
        (set-front! q new-node)
        (set-rear! q new-node)
        q)
      (else
        (set-next! new-node (front q))
        (set-prev! (front q) new-node)
        (set-front! q new-node)
        q))))

(define (rear-insert! q x)
  (let ((new-node (list x nil nil)))
    (cond
      ((empty-deque? q)
        (set-front! q new-node)
        (set-rear! q new-node)
        q)
      (else
        (set-prev! new-node (rear q))
        (set-next! (rear q) new-node)
        (set-rear! q new-node)
        q))))

(define (front-delete! q)
  (cond
    ((empty-deque? q) (error "delete called with an empty queue"))
    ((single-node? (front q))
      (set-front! q nil)
      (set-rear! q nil)
      q)
    (else
      (set-front! q (next-node (front q)))
      (set-prev! (front q) nil)
      q)))

(define (rear-delete! q)
  (cond
    ((empty-deque? q) (error "delete called with an empty queue"))
    ((single-node? (rear q))
      (set-front! q nil)
      (set-rear! q nil)
      q)
    (else
      (set-rear! q (prev-node (rear q)))
      (set-next! (rear q) nil)
      q)))

(define (values-deque q)
  (define (iter slice)
    (cond
      ((null? slice) nil)
      (else (cons (val-node slice) (iter (next-node slice))))))
  (iter (front q)))

(define (print-deque q)
  (log (values-deque q)))


(define d (make-deque))
(print-deque d)
(print-deque (front-insert! d 1))
(print-deque (front-insert! d 2))
(print-deque (front-delete! d))
(print-deque (front-delete! d))
(print-deque (rear-insert! d 1))
(print-deque (rear-delete! d))
