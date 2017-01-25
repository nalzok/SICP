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
;;    "equivalence" does not apply. In interval arithmetic, an equivalent
;;    transformation can surprisingly make things different. For example,
;;    as shown in ex2.14.scm, (div-interval r1 r1) isn't exactly 1±0, which
;;    means multiplying the numerator and the denominator with a same value
;;    would change the computed value of the fraction.
;;
;;    Actually, I think there are no concepts of "equivalence" in interval
;;    arithmetic. Let's take a random interval, say, 1±1, for example. It
;;    could be -0.5, or 0.27, so we cannot say 1±1 == 1±1, which tells us
;;    that each interval isn't even "equivalent" to itself. For the same
;;    reason, there are no "equivalent" intervals in interval arithmetic.
;;    Presumably, this lack of "equivalence" is why equivalent algebraic 
;;    expressions may lead to different answers.

;; Q: Can you devise an interval-arithmetic package that does not have this
;;    shortcoming, or is this task impossible?
;;
;; A: I think it's possible. I can write a system which transforms all the
;;    expressions to their "best" form before computing them out using the
;;    inexact interval arithmetic. However, writing such a package would
;;    be extremely difficult.

