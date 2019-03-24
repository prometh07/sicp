#lang sicp

; a
(define (get-record employee-name division)
  ((get 'get-record (division-name division))
    employee-name
    (division-file division)))

; division should be a (name, dataset) cons, name is a 'type' used in 2d table
; of specific implementations to retrieve

; b
(define (get-salary employee-name division)
  ((get 'get-salary (division-name division)) (get-record employee-name division)))

; c
(define (find-employee-record employee-name divisions)
  (define record
    (if (null? divisions)
      '()
      (get-record employee-name (car divisions))))
  (cond
    ((null? divisions) '())
    ((not (null? record)) record)
    (else (find-employee-record employee-name (cdr divisions)))))

; d
; New implementations should be added to the put/get table with unique
; division names.
