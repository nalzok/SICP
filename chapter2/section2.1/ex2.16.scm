;;; Exercise 2.16
;;; =============

;; Q: Explain, in general, why equivalent algebraic expressions may lead
;;    to different answers.
;;
;; A: Technically speaking, you cannot ask me why two things are different.
;;    There are no reasons behind differences, but there are reasons behind
;;    similarities. For example, why 2 is not 2 + 1? There are no reasons.
;;    Then why 1 + 2 is 2 + 1? We have a reason now: because addition is
;;    commutative.
;;    
;;    Algebraically equivalent expressions are no longer equivalent when
;;    performing "interval arithmetic", in which the algebraic concept of
;;    "equivalent" does not apply.

;; Q: Can you devise an interval-arithmetic package that does not have this
;;    shortcoming, or is this task impossible?
;;
;; A: I think it's possible. I can write a system which transforms all the
;;    expressions to their "best" form before computing them out using the
;;    inexact interval arithmetic.

