#lang sicp
(#%require "helpers.rkt")

; The algorithm below counts distinct pairs by pre-order list traversal.
; At every iter call, for each node, we visit the left subtree first. Then we use the returned
; list of visited pointers to check the right subtree. In the end we sum
; the numbers of visited distinct pairs and add one (to include a current node)
; and return a pair consisting of this sum and the list of visited nodes.

(define (count-pairs x)
  (define (visited? elem visited)
    (cond
      ((null? visited) #f)
      ((eq? elem (car visited)) #t)
      (else (visited? elem (cdr visited)))))

  (define (iter cur visited)
    (if (or (not (pair? cur)) (visited? cur visited))
      (cons 0 visited)
      (let ((left-iter (iter (car cur) (append visited (list cur)))))
        (let ((right-iter (iter (cdr cur) (cdr left-iter))))
          (cons (+ 1 (car left-iter) (car right-iter)) (cdr right-iter))))))

  (car (iter x '())))

(define x (list (list 1) 2))
(log (count-pairs x))

(define p (list 1 2))
(define y (cons p (cdr p)))
(log (count-pairs y))

(define q (cons 1 2))
(define r (cons q q))
(define z (cons r r))
(log (count-pairs z))
