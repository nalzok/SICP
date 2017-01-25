;;; Exercise 2.21
;;; =============

(define (square-list items)
  (if (null? items)
    '()
    (cons (square (car items))
          (square-list (cdr items)))))

(square-list (list 1 2 3 4))
;Value 13: (1 4 9 16)

(define (square-list items)
  (map (lambda (x) (square x))
       items))

(square-list (list 1 2 3 4))
;Value 14: (1 4 9 16)

