#lang sicp

(define (p row col)
  (cond ((or (= row 0) (= col 0)) 1)
        (else (+ (p (- row 1) col) (p row (- col 1))))))

(p 2 2)
