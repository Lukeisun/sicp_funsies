#lang sicp
;; (1 3 (5 7) 9)
;; (cdr (car (cdr (cdr list))))
;; try it!
(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))
(car (cdaddr (list 1 3 (list 5 7) 9))) ;; practicing using this (why no cadaddr D:)
(cadr (caddr (list 1 3 (list 5 7) 9))) ;; practicing using this
;; missed the left most car at first, accidentally typed cons for rightmost car as well
;; ((7))
;; (caar 7)
(list (list 7))
(caar (list (list 7)))
;; noice first try
;;(1 (2 (3 (4 (5 (6 7))))))
;; (cdddddr li)
(define t3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display "t3")
(newline)
(cadr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr t3)))))))))))
(cadr (cadr (cadadr (cadadr t3))))
;; completely missed this one, i think i get 2.24 more now though

