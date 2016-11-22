;;; Exercise 1.5
;;; ============
;;;
;;; It can be shown that, for procedure applications that can be modeled
;;; using substitution and that yield legitimate values, normal-order 
;;; and applicative-order evaluation produce the same value. However, this
;;; exercise shows an instance of an ''illegitimate'' value.

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; Applicative-order evaluation
; (test 0 (p))
; ->
; (test 0 (p))
; ->
; ......

; Normal-order evaluation
; (test 0 (p))
; ->
; (if (= 0 0)
;   0
;   (p))
; ->
; 0

