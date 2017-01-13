;;; Exercise 1.4
;;; ============

(define (a-plus-abs-b a b)
  ((if (> b 0)
     +
     -)
   a
   b))

(a-plus-abs-b 12 -34)
;Value: 46

;;`(if (> b 0) + -)` evaluates to + if b is greater than 0, and - otherwise.
