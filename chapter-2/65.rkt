#lang sicp
(#%require "helpers.rkt")

(define (make-tree elem left right)
  (list elem left right))

(define (left-branch t) (cadr t))
(define (right-branch t) (caddr t))
(define (entry t) (car t))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (tree2list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (union-list x y)
  (cond
    ((null? x) y)
    ((null? y) x)
    ((< (car x) (car y)) (cons (car x) (union-list (cdr x) y)))
    ((= (car x) (car y)) (cons (car x) (union-list (cdr x) (cdr y))))
    ((> (car x) (car y)) (cons (car y) (union-list x (cdr y))))))

; why is it O(n)?
; tree2list - O(n)
; union-list - O(n) - here the 2 sets are merged; in fact, union operation
; look the same as for the ordered lists representation, we just transform
; it to the tree in the end
; list->tree - O(n)
(define (union-set t1 t2)
  (list->tree (union-list (tree2list t1) (tree2list t2))))

; intersection should look the same - convert tree into lists, then
; create an 'intersection list', then convert it into a tree

(log (union-set (list->tree (list 1 2 3 4)) (list->tree (list 1 2 5))))
