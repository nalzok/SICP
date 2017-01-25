;;; Exercise 2.45
;;; =============

(define (split op1 op2)
  (define (split-helper painter n)
    (if (= n 0)
      painter
      (let ((smaller (split-helper painter (- n 1))))
       (op1 painter (op2 smaller smaller)))))
  split-helper)

