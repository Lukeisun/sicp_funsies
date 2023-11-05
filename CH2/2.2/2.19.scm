#lang sicp
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define no-more? null?)
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (first-denomination coin-values)
  (car coin-values))
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 00) (no-more? coin-values)) 0)
        (else
         (+ (cc amount (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values)) coin-values)))))
(cc 100 us-coins)
(cc 20 uk-coins)
;; my gut feeling was that the order did matter
;; but I tried it, and realized that it didn't
;; thinking about it now, it makes sense as
;; in each step of the recursion we simply ask two questions
;; "if I dont use this coin how many ways can i make change with the rest?"
;; "if I use this coin, how many ways can I make change with the same pool of coins?"
;; every possible question is explored and answered, regardless of order.
