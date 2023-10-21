#lang sicp
(define (inc x)
  (+ x 1))

(define (filtered-accumulate filter combiner null-val term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (let ((x (term i)))
                         (if (filter x)
                             (combiner x result)
                             result)))))
  (iter a null-val))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (next x)
  (if (= x 2)
      3
      (+ x 2)))
(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))
(filtered-accumulate (lambda (x) #t) * 1 (lambda (x) x) 1 inc 10) ;; product
;; a
(filtered-accumulate prime? + 0 (lambda (x) x) 2 inc 100)
(filtered-accumulate prime? + 0 (lambda (x) x) 2 inc 20)
(define n 10)
(define (gcd? a)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  (= (gcd a n) 1))
;; b
(filtered-accumulate gcd? * 1 (lambda (x) x) 1 inc n)
