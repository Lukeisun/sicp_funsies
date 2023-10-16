#lang sicp

(define (smallest-divisor n)
  (define (iter divisor)
    (cond ((= (remainder n divisor) 0) divisor)
          ((> (* divisor divisor) n) n)
          (else (iter (+ divisor 1)))))
  (iter 2))
(smallest-divisor 144)
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
