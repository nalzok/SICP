;;; Exercise 2.28
;;; =============

(define (fringe tree)
  (if (null? tree)
    '()
    (let ((this (car tree))
          (rest (cdr tree)))
      (if (pair? this)
        (append (fringe this)
                (fringe rest))
        (cons this (fringe rest))))))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
;Value 13: (1 2 3 4)

(fringe (list x x))
;Value 14: (1 2 3 4 1 2 3 4)

