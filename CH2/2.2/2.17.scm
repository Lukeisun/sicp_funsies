#lang sicp
(define (last-pair li)
  (if (null? (cdr li))
      li
      (last-pair (cdr li))))
(last-pair (list 23 72 149 34))
(last-pair (list 23 72 149 ))
