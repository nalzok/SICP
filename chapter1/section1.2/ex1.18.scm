;;; Exercise 1.18
;;; =============
;;;
;;; For most recursive processes we've encounted by now, transforming them to
;;; their iterative form roughly consists of 3 steps:
;;; 1. Define a helper procedure with an extra "result" parameter. In this 
;;;    case, let's call this parameter `product`.
;;; 2. Apply what would be applied to the procedure's return value to that
;;;    parameter.
;;; 3. Call this helper procedure to get started. The initial value for the
;;;    "result" parameter is the value for the exit point of the recursive
;;;    process, so that the resulting iterative process starts from where the
;;;    recursive process starts to shrink. In this case, it's the later 0 in
;;;    the `((= b 0) 0)` clause in ex1.17.scm.



(define (fast-multiply a b)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (double n)
    (* n 2))
  (define (half n)
    (/ n 2))
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

