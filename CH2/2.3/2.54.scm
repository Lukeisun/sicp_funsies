#lang sicp

(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2))
         #t)
        ((eq? (car l1) (car l2))
         (equal? (cdr l1) (cdr l2)))
        (else
         #f)))
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
''abra
(car ''abra)
(car (cdr ''abra))
