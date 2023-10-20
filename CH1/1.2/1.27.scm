#lang sicp
(define (square x)
  (* x x))
(define (even? x)
  (= (remainder x 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-no-rand n a)
  (= (expmod a n n) a))

(define (prime? n a)
  (cond ((= n a) true)
        ((fermat-no-rand n a) (prime? n (+ a 1)))
        (else false)))

(prime? 561 0)
(prime? 1105 0)
(prime? 1729 0)
(prime? 2465 0)
(prime? 2821 0)
(prime? 6601 0)
