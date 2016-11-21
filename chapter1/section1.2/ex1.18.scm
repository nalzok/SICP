;;; Exercise 1.18
;;; =============
;;;
;;; In general, transforming a recursive process to its iterative form
;;; consists 2 steps:
;;; 1. Add a "result" variable to the formal parameters of the procedure.
;;;    In this case, it's called "product".
;;; 2. Apply what would be applied to the procedure's return value to that
;;;    "result" variable.



(define (fast-multiply a b)
  (define (even? num)
    (= (remainder num 2) 0))
  (define (double num)
    (* num 2))
  (define (half num)
    (/ num 2))
  (define (multi-iter a b product)
    (cond ((= b 0) product)
          ((even? b) (multi-iter a (half b) (double product)))
          (else (multi-iter a (- b 1) (+ product a)))))
  (multi-iter a b 0))

(newline)
(display (fast-multiply 42 11))
;Value: 462
(newline)
(display (fast-multiply 11 42))
;Value: 462

