#lang sicp
(define (product term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) (* (term i) result))))
  (iter a 1))
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))
(define (inc x)
  (+ x 1))
(define (inc-2 x)
  (+ x 2))
(define (identity x)
  x)
(define (square x)
  (* x x))
;; factorial
(product (lambda (x) x) 1 inc 10)
;; recursive product
(product-rec identity 1 inc 10)
(product square 3.0 inc-2 7.0)
(define x 2)
(define y 10000)
;; pretty messy but she'll do
(* (/(/ (product square x inc-2 y) (* x y)) (product square (+ x 1) inc-2 (- y 1))) 4.0)
