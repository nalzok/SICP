;;; Exercise 1.34
;;; =============
;;;
;;; `Lambda` and `let` are convenient tools, but sadly this exercise isn't
;;; closely related to them...

(define (f g)
  (g 2))

(newline)
(display (f square))
;Value: 4

(newline)
(display (f (lambda (z) (* z (+ z 1)))))
;Value: 6

(newline)
(display (f f))
;Value: ;The object 2 is not applicable.
;
; (f f) -> (f 2) -> (2 2) -> error
