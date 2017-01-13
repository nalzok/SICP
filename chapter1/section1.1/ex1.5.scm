;;; Exercise 1.5
;;; ============

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; (test 0 (p))
; <time out>

;; Applicative-order evaluation
;;
;;    (test 0 (p))
;; -> (test 0 (p)) ; trying to evaluate (p)
;; -> (test 0 (p)) ; trying to evaluate (p), again
;; -> ......
;;
;; Normal-order evaluation
;;
;;    (test 0 (p))
;; -> (if (= 0 0)
;;      0
;;     (p))
;; -> 0

