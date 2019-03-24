#lang sicp
(#%require "helpers.rkt")

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (records table) (cdr table))

    (define (last-key? keys)
      (and (not (null? keys)) (null? (cdr keys))))

    (define (is-table? x)
      (list? (cdr x)))

    (define (assoc keys records)
      (cond
        ((null? keys) records)
        ((null? records) #f)
        ((not (list? records)) #f)
        ((equal? (car keys) (caar records))
          (if (last-key? keys)
            (assoc (cdr keys) (car records))
            (assoc (cdr keys) (cdr (car records)))))
        (else (assoc keys (cdr records)))))

    (define (lookup keys)
      (let ((record (assoc keys (records local-table))))
        (if record
          (cdr record)
          #f)))

    (define (insert! keys val)
      (define (prepend table item)
        (set-cdr! table (cons item (cdr table))))

      (define (iter remaining-keys current-table)
        (cond
          ((null? remaining-keys) 'ok)
          ((last-key? remaining-keys)
            (let ((record (assoc (list (car remaining-keys)) (records current-table))))
              (if record
                (set-cdr! record val)
                (prepend current-table (cons (car remaining-keys) val)))
              (iter (cdr remaining-keys) current-table)))
          (else
            (let ((record (assoc (list (car remaining-keys)) (records current-table))))
              (cond
                ((equal? record #f)
                  (prepend current-table (list (car remaining-keys)))
                  (iter (cdr remaining-keys) (car (records current-table))))
                ((is-table? record)
                  (iter (cdr remaining-keys) record))
                (else
                  (set-cdr! record '())
                  (iter (cdr remaining-keys) record)))))))
    (iter keys local-table))

    (define (dispatch method)
      (cond
        ((equal? method 'lookup) lookup)
        ((equal? method 'insert!) insert!)
        (else (error "unknown table method"))))

  dispatch))

(define t (make-table))
((t 'lookup) (list 'a 'b))
((t 'insert!) (list 'a 'b) 1)
((t 'lookup) (list 'a 'b))
((t 'lookup) (list 'a))
((t 'insert!) (list 'a) 1)
((t 'lookup) (list 'a))
((t 'lookup) (list 'a 'b))
((t 'insert!) (list 'a 'b) 1)
((t 'insert!) (list 'a 'a) 2)
((t 'lookup) (list 'a 'b))
((t 'lookup) (list 'a 'a))
((t 'lookup) (list 'a))
