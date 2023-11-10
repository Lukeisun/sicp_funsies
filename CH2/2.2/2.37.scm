#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;; had to look at solution, still getting my head around map
;; beautiful solution though
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

;; cool :D
(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) ;;rows of m
           (map (lambda (y) ;; columns of n
                  (dot-product x y))
                cols))
         m)))

(define x (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(transpose x)
(dot-product (car x) (car x))
(matrix-*-vector x (car x))
(matrix-*-matrix x (transpose x))
