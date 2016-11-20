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

