#lang sicp

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval from to)
  (if (> from to)
    nil
    (cons from (enumerate-interval (+ 1 from) to))))

(define (filter predicate seq)
  (define (iter result rest)
    (cond
      ((null? rest) result)
      ((predicate (car rest)) (iter (append result (list (car rest))) (cdr rest)))
      (else (iter result (cdr rest)))))
  (iter nil seq))

(define (queens board-size)
  (define empty-board nil)
  (define (safe? k positions)
    (define last (list-ref positions (- k 1)))
    (define all-but-last (reverse (cdr (reverse positions))))
    (null? (filter (lambda (el)
      (define coef (/ (- (cadr el) (cadr last)) (- (car el) (car last))))
      (or
        (= coef 0)
        (= (abs coef) 1))) all-but-last)))
  (define (adjoin-position new-row k rest-of-queens)
    (append rest-of-queens (list (list k new-row))))
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map
              (lambda (new-row) (adjoin-position new-row k rest-of-queens))
              (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(display (length (queens 8)))
(newline)
(display (queens 4))
