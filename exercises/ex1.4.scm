(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; if b > 0,
;   (+ a b)
; else,
;   (- a b)
