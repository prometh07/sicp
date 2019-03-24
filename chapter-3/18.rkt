#lang sicp

; naive solution - can find a cycle only if an input list isn't a nested structure
; Visited nodes are remembered in a separate list, at each traversal step we
; check whether a given node has been already added to the visited nodes' list.
(define (naive-has-cycle? x)
  (define (visited? elem visited)
    (cond
      ((null? visited) #f)
      ((eq? elem (car visited)) #t)
      (else (visited? elem (cdr visited)))))
  (define (iter cur visited)
    (cond
      ((not (pair? cur)) #f)
      ((visited? cur visited) #t)
      (else (iter (cdr cur) (append visited (list cur))))))
  (iter x '()))

(define x (list 1))
(define y (list 1 1))
(define z (list x x))
(define z2 (list x))
(set-cdr! z2 z2)

; taken from https://wizardbook.wordpress.com/2010/12/16/exercise-3-18/
(define l1 (list 'a 'b 'c))
(define l2 (list 'a 'b 'c))
(set-cdr! (cdr (cdr l2)) l2)
(define l3 (list 'a 'b 'c 'd 'e))
(set-cdr! (cdddr l3) (cdr l3))
(define l4 (list 'a 'b 'c 'd 'e))
(set-car! (cdddr l4) (cddr l4))

(naive-has-cycle? x)
(naive-has-cycle? y)
(naive-has-cycle? z)
(naive-has-cycle? z2)
(display "---------------")
(newline)
(naive-has-cycle? l1)
(naive-has-cycle? l2)
(naive-has-cycle? l3)
(naive-has-cycle? l4)
