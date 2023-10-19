#lang sicp
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))
(define (next x)
  (if (= x 2)
      3
      (+ x 2)))
(define (search-for-prime i found start-time)
  (cond ((= found 3) (newline) (display (- (runtime) start-time)))
        ((prime? i)
         (newline)
         (display i)
         (search-for-prime (+ i 1) (+ found 1) start-time))
        (else (search-for-prime (+ i 1) found start-time))))
;; yes it is about twice as fast
;; 1.22 sits around 110000 for the runtime
;; 1.23 sits around 60000 for the runtime
(search-for-prime 1000000000000 0 (runtime))
