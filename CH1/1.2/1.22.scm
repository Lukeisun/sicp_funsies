#lang sicp
;; (define (timed-prime-test n)
;;   (newline)
;;   (display n)
;;   (start-prime-test n (runtime)))
;;
;; (define (start-prime-test n start)
;;   (if (prime? n)
;;       (report-prime (- (runtime) start))))
;;
;; (define (report-prime elapsed-time)
;;   (display " *** ")
;;   (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-prime i found start-time)
  (cond ((= found 3) (newline) (display (- (runtime) start-time)))
        ((prime? i)
         (newline)
         (display i)
         (search-for-prime (+ i 1) (+ found 1) start-time))
        (else (search-for-prime (+ i 1) found start-time))))
(search-for-prime 100000000000000 0 (runtime))
;; (fast-prime? 561 561)
