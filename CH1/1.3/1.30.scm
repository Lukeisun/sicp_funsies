#lang sicp
(define (sum term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (+ (term i) result))))
  (iter a 0))
(define (cube x)
  (* x x x))
(define (inc x)
  (+ x 1))
(define (sum-rec term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))
;; (sum-rec cube 1 inc 100000000)
(sum cube 1 inc     10)
