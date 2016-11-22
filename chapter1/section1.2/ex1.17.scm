;;; Exercise 1.17
;;; =============
;;;
;;; Use the following equation:
;;; a*b = (2*a)*(b/2), if b is even
;;;       a*(b-1)+a  , if b is odd



(define (fast-multiply a b)
  (define (even? num)
    (= (remainder num 2) 0))
  (define (double num)
    (* num 2))
  (define (half num)
    (/ num 2))
  (cond ((= b 0) 0)
        ((even? b) (double (fast-multiply a (half b))))
        (else (+ (fast-multiply a (- b 1)) a))))

(newline)
(display (fast-multiply 42 11))
;Value: 462
(newline)
(display (fast-multiply 11 42))
;Value: 462

