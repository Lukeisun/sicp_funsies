#lang sicp

(define (cube x)
  (* x x x))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (term i)
    (* (f (+ a (* i h))) (multiplier i)))
  (define (multiplier x)
    (cond  ((or (= x 0) (= x n)) 1)
           ((= (remainder x 2) 0) 2)
           (else 4)))
  ;; (* (/ h 3.0) (sum term 0.0 inc n)))
  ;; this is what i was originally trying to do, why I dont know :(
  (* (/ h 3.0) (+ (f a) (f (+ a (* h n))) (sum term 1.0 inc (- n 1)))))
;; (define (inner acc i )
;;   (if (= i n)
;;       (* (+ acc (f a) (f (+ a (* n h)))) (/ h 3.0))
;;       (inner (+ acc (* (multiplier i) (f (+ a (* i h))))) (+ i 1))))
;; (inner 1 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) ( sum term (next a) next b))))
;; Taken from https://mk12.github.io/sicp/exercise/1/3.html
(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (term k)
      (* (f (+ a (* k h)))
         (if (or (= k 0) (= k n))
             1
             (+ 2 (* 2 (remainder k 2))))))
    (* h 1/3 (sum term 0.0 inc n))))
(simpson cube 0 1.0 1000)
(simpsons cube 0 1.0 1000)
