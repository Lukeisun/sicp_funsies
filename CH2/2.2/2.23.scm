#lang sicp
(define (for-each f li)
  ;; http://community.schemewiki.org/?sicp-ex-2.23
  ;; i had it but it crashed on last input, for some reason
  ;; cond works better here /shrug
  (cond ((not (null? li))
         (f (car li))
         (for-each f (cdr li)))))
(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
