#lang sicp
(define (same-parity i . arr)
  (define (parity)
    (if (= (remainder i 2) 0)
        (lambda (x) (= (remainder x 2) 0))
        (lambda (x) (not (= (remainder x 2) 0)))))
  (define (build-list check current_list built-list)
    (if (null? current_list)
        built-list
        (if (check (car current_list))
            (cons (car current_list) (build-list check (cdr current_list) built-list)) ;; still weird to think about in this way .-.
            (build-list check (cdr current_list) built-list))))
  (build-list (parity) (cons i arr) '()))

(same-parity 1 2 3 4 5 6 7)
(same-parity 1 1 1 1 5 10)
(same-parity 2 3 4 5 6 7)
