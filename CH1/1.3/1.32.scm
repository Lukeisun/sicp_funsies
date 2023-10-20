#lang sicp
;; (define (product term a next b)
;;   (define (iter i result)
;;     (if (> i b)
;;         result
;;         (iter (next i) (* (term i) result))))
;;   (iter a 1))
(define (inc x)
  (+ x 1))

(define (accumulate combiner null-val term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (combiner (term i) result))))
  (iter a null-val))
(accumulate * 1 (lambda (x) x) 1 inc 10) ;; product
(accumulate + 0 (lambda (x) (* x x x)) 1 inc 10) ;; sum cube
