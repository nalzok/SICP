;;; Exercise 1.4
;;; ============
;;;

(define (a-plus-abs-b a b)
  ((if (> b 0)
     +
     -)
   a
   b))

; Compound expressions may evaluate to operators. In this exercise, compound
; expression`(if (> b 0) + -)` computes to either + or -, depending on the
; value of `b`.

