#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (define (iter i acc)
    (if (= i n)
        acc
        (iter (+ i 1) (compose f acc))))
  (iter 1 f))
(define (square x) (* x x))
((repeated square 2) 5)
