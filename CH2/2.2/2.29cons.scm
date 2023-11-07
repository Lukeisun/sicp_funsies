#lang sicp
;; all you have to changfe for the cons version
;; are the right element calls (cdr) so right-branch/branch-structure
;; from (car (cdr {branch/mobile})) to (cdr {branch/mobile})
(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cdr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cdr branch))

(define (total-weight mobile)
  (define (helper mobile)
    (if (null? mobile)
        0
        (let* ((lbranch (left-branch mobile))
               (rbranch (right-branch mobile))
               (lstructure (branch-structure lbranch))
               (rstructure (branch-structure rbranch))
               (left-pair? (pair? lstructure))
               (right-pair? (pair? rstructure)))
          (cond ((and left-pair? right-pair?) (+ (total-weight lstructure) (total-weight rstructure)))
                (left-pair? (+ (total-weight lstructure) rstructure))
                (right-pair? (+ lstructure (total-weight rstructure)))
                (else (+ lstructure rstructure))))))
  (helper mobile))
(define (torque branch)
  (if (pair? (branch-structure branch))
      (* (branch-length branch) (torque (left-branch (branch-structure branch))) (torque (right-branch (branch-structure branch))))
      (* (branch-length branch) (branch-structure branch))))
(define (balanced? mobile)
  (= (torque (left-branch mobile)) (torque (right-branch mobile))))
(define x (make-mobile (make-branch 10 20) (make-branch 5 20)))
(define y (make-mobile (make-branch 5 x) (make-branch 5 20)))
(define z (make-mobile (make-branch 5 y) (make-branch 5 x)))
(define b (make-mobile (make-branch 1 x) (make-branch 1 20000)))
(total-weight x)
(total-weight y)
(total-weight z)
(balanced? x)
(balanced? b)
;; List output
;; 40
;; 60
;; 100
;; #f
;; #t
;; Cons output
;; 40
;; 60
;; 100
;; #f
;; #t
