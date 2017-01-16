;;; Exercise 1.34
;;; =============

(define (f g)
  (g 2))

(f f)
;The object 2 is not applicable.

;; (f f) -> (f 2) -> (2 2) -> error

