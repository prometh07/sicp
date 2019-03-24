#lang sicp

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (records) (cdr local-table))

    (define (assoc key records)
      (cond
        ((null? records) #f)
        ((same-key? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

    (define (lookup key)
      (let ((record (assoc key (records))))
        (if record
          (cdr record)
          #f)))

    (define (insert! key val)
      (let ((record (assoc key (records))))
        (if record
          (set-cdr! record val)
          (set-cdr! local-table
            (cons (cons key val) (cdr local-table))))))

    (define (dispatch method)
      (cond
        ((equal? method 'lookup) lookup)
        ((equal? method 'insert!) insert!)
        (else (error "unknown table method"))))

  dispatch))

(define t (make-table equal?))
((t 'lookup) 'a)
((t 'insert!) 'a 1)
((t 'lookup) 'a)

(define t2 (make-table (lambda (x y) (equal? (abs x) (abs y)))))
((t2 'insert!) -1 'a)
((t2 'lookup) -1)
((t2 'lookup) 1)
((t2 'insert!) 1 'b)
((t2 'lookup) -1)
((t2 'lookup) 1)
