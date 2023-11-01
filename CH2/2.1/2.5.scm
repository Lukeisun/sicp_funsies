#lang sicp
(define (cons a b)
  ;; to do
  (* (expt 2 a) (expt 3 b))
  )
(define (count x z)
  (define (iter num acc)
    (if (= (remainder num x) 0)
        (iter (/ num x) (+ acc 1))
        acc))
  (iter z 0))
(define (cdr z)
  ;; todo
  (count 3.0 z)
  )
(define (car z)
  ;; todo
  (count 2.0 z)
  )
(define z (cons 3 10))
z
(car z)
(cdr z)
