#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (map (lambda (k) (list i j k))
             (enumerate-interval 1 n)))
      (enumerate-interval 1 n)))
   (enumerate-interval 1 n)))

(define (sum-to? i j k s)
  (= (+ i j k) s))

(define (sum-pairs n s)
  (define sum? (lambda (x) (sum-to? (car x) (cadr x) (caddr x) s)))
  (filter sum? (unique-triples n)))
;; im assuming there is no restriction on i, j, k.
;; if we do something like the previous examples would just have to replace
;; n's in the inner flatmaps with (- i 1), and (- j 1)
(sum-pairs 6 9)
(map (lambda (x) (+ (car x) (cadr x) (caddr x))) (sum-pairs 6 9))
