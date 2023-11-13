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

(define get-row car)
(define get-col cadr)
;; board is defined by (row_num, col_num)
(define (safe? k positions)
  (let* ((kth-queen (car positions))
         (r (car kth-queen)))
    (define (iter restq col-dist)
      (cond ((or (null? restq) (null? (car restq))) #t)
            ((= (get-col (car restq)) k) #f) ;; dont really need to check for this
            ((= (get-row (car restq)) r) #f)
            ((= (get-row (car restq)) (- r col-dist)) #f)
            ((= (get-row (car restq)) (+ r col-dist)) #f)
            (else (iter (cdr restq) (+ col-dist 1)))))
    (iter (cdr positions) 1)))

(define (queens board-size)
  (define empty-board (list))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-positition new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-positition new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))
(flatmap
 (lambda (rest-of-queens)
   (map (lambda (new-row)
          (adjoin-positition new-row 1 rest-of-queens))
        (enumerate-interval 1 3)))
 (list (list)))
(queens 4)
(length (queens 8)) ;; 92!
;; I had a pretty tough time with this one, I struggled quite a bit
;; even thinking of how this problem was represented. Especially
;; comparing it to a C-style solution. So I did have to look online to see how to do it.
;; So i'll try explaining to cement my understanding.
;; Our base case flat map will generate an empty list '()
;; in our call before that we have k = 1, rest-of-queens = '(),
;; and then map over an interval of (1..board-size). Our flat map will give us
;; positions ( (1, ..board-size) (1, board-size-1) ... (1, board-size-board-size) )
;; no filtering is done here as theyre all valid the null? checks would make sure.
;; and for subsequent calls we map over the previous, adding our new row with a queen
;; at the kth column.
;; I think something crucial about this is with safe?, our kth row will be the
;; current element in our list (the first car). The next insight is also realizing
;; that the rest of the "board" follows this ordering. So you can safely assume youre working
;; with the previous column, or the previous previous and so forth. You don't even need to check
;; for equivalent columns, as the way we structure our data makes it impossible for this to happen.
;; Checking the row is simple enough we just check if the current row is the same as our
;; row with our current queen. And then for the diagonal checks, we can just check if the current
;; row is our queens row minus the columns weve seen (since we count how many columns weve seen thus far).
