#lang sicp
(define li (list 1 (list 2 (list 3 4))))
(cdr li)
(car (cdr li))
(cdr (car (cdr li)))
(car (cdr (car (cdr li))))
(cadadr li)
;; box
;;     (cdr li)                 (car (cdr li))
;; [1, (list 2 (list 3 4))] -> [(list 2 (list 3 4)), '()]
;; -> [2, (list 3 4)] ->          [list (3 4), '()] -> [3, 4]
;;   (cdr (car (cdr li)))    (car (cdr(car (cdr li))))
;; tree
;;      o
;;     / \
;;    1   o
;;       / \
;;      2   o
;;         / \
;;        3   4
