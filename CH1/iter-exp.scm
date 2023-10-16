#lang sicp
(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))
(define (exp b n)
  (cond ((= n 0) 1)
        ((even? n)  (square (exp b (/ n 2))))
        (else (* b (exp b (- n 1))))))

(define (iter-exp a b n)
  (display (* a (exp b n)))
  (cond ((= n 0) a)
        ((even? n) (iter-exp a (* b b) (/ n 2)))
        (else (iter-exp (* a b) b (- n 1)))))
(iter-exp 1 2 3)