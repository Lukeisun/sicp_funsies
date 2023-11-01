#lang sicp
;; cons returns a procedure which takes in a procedure and applies x y as arguments
;; to the procedure which was taken in
(define (cons x y)
  (lambda (m) (m x y)))
;; z is the returned procedure after calling cons
;; lambda in car/cdr is the procedure that z takes
;; in. z then applies as arguments x y to this lambda.
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))
;; done for understanding
(define (m z)
  (z (lambda (p q) (* p q))))
(define pair (cons 10 20))
(car pair)
(cdr pair)
(m pair)
