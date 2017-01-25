;;; Exercise 2.27
;;; =============

(define (reverse items)
  (define (iter a result)
    (if (null? a)
      result
      (iter (cdr a) (cons (car a) result))))
  (iter items '()))

(define (deep-reverse items)
  (define (iter a result)
    (if (null? a)
      result
      (let ((this (car a))
            (rest (cdr a)))
        (iter rest (cons (if (pair? this)
                           (deep-reverse this)
                           this)
                         result)))))
  (iter items '()))

(define x (list (list 1 2) (list 3 4)))

x
;Value 13: ((1 2) (3 4))
(reverse x)
;Value 14: ((3 4) (1 2))
(deep-reverse x)
;Value 15: ((4 3) (2 1))

