#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))
(define (mul-interval x y)
  ;; to be honest, for 2.11 i dont know what the nine cases are :(
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  ;; 2.9
  (if (or (= (upper-bound y) 0) (= (lower-bound y) 0))
      (display "Divide by Zero Error")
      (mul-interval x
                    (make-interval
                     (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))

;; 2.7
(define (make-interval a b)
  (if (> a b)
      (cons a b)
      (cons b a)))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))
;;2.8
(define (sub-interval x y)
  (make-interval (abs (- (lower-bound x)
                         (lower-bound y)))
                 (abs (- (upper-bound x)
                         (upper-bound y)))))
;; 2.9
(define (width interval)
  (/ (abs (- (upper-bound interval) (lower-bound interval))) 2))
;;
(define (print-interval interval)
  (newline)
  (display "(")
  (display (lower-bound interval))
  (display ", ")
  (display (upper-bound interval))
  (display ")")
  (newline))
;; 2.12
(define (make-center-percent center percent)
  (define tolerance (* center percent))
  (make-interval (- center tolerance) (+ center tolerance)))
(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))
(define (percent interval)
  (/ (- (upper-bound interval) (center interval)) (center interval)))
;;

(define int1 (make-interval 6.12 7.48))
(define int2 (make-center-percent 4.7 .05))
(print-interval int2)
(center int2)
(percent int2)
(percent int1)

(define zInt (make-interval 0 0))
(div-interval int1 zInt)
(print-interval int1)
(print-interval int2)
(print-interval (add-interval int1 int2))
(print-interval (sub-interval int1 int2))
(width int1)
(width int2)
;; this is (width int1) + (width int2)
(width (add-interval int1 int2))
;; this is (width int1) - (width int2)
(width (sub-interval int1 int2))
;; this is not (width int1) * (width int2)
(width (mul-interval int1 int2))
(width (div-interval int1 int2))


;;2.13
(newline)
(display "2.13")
(newline)
;; percent after multiplication is roughly equal to the percent of both intervals added together
(+ (percent int1) (percent int2))
(percent (mul-interval int1 int2))

;;2.14
(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))
(newline)
(display "2.14")
(newline)
;; big difference between these
(par1 int1 int2)
(par2 int1 int2)
;; even bigger difference here
(par1 int1 int1)
(par2 int1 int1)

