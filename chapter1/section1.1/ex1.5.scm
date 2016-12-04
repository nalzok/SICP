;;; Exercise 1.5
;;; ============
;;;
;;; Normally, normal-order and applicative-order evaluation would produce the
;;; same value. However, the expression in this exercise is ''illegitimate''.

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; Applicative-order evaluation
;
;    (test 0 (p))
; -> (test 0 (p)) ; trying to evaluate (p)
; -> (test 0 (p)) ; trying to evaluate (p), again
; -> ......
;
; Normal-order evaluation
;
;    (test 0 (p))
; -> (if (= 0 0)
;      0
;     (p))
; -> 0

