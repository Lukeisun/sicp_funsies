#lang sicp
(#%require racket/trace)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (trace iter)
  (iter initial sequence))
(accumulate / 1 (list 1 2 3)) ;; 1 / (2 / (3 / 1)) ;; 1/(2/3)  = 3/2
(fold-left / 1 (list 1 2 3)) ;; ((3 / 1) / 2 / 1) ;; 3/2/1
;; very wrong on these woops
(accumulate list '() (list 1 2 3)) ;; (list 1 2 3)
(fold-left list '() (list 1 2 3)) ;; (list 3 2 1)
(accumulate + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))
;; properties should be commutative if fold-right and fold-left produce same values
;; e.g. (1 / 2) != (2 / 1)
