#lang sicp
(define (fib n)
  (fib-iter 1 0 0 1 n))
;; to be honest didnt quite get this one at all
;; referred to http://community.schemewiki.org/?sicp-ex-1.19
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q));;p`
                   (+ (* 2 p q) (* q q)) ;;q`
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
(fib 100)
