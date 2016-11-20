;;; Exercise 1.4
;;; ============
;;;
;;; Operators can also be compound expressions. In this exercise,
;;; compound expression (if (> b 0) + -) computes to either + or -,
;;; depending on the value of b.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

