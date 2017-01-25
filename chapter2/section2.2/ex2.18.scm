;;; Exercise 2.18
;;; =============

(define (reverse items)
  (define (iter a result)
    (if (null? a)
      result
      (iter (cdr a) (cons (car a) result))))
  (iter items '()))

(reverse (list 1 4 9 16 25))
;Value 13: (25 16 9 4 1)

