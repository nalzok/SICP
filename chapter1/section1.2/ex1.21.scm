;;; Exercise 1.21
;;; =============
;;;
;;; Just call `smallest-divisor` with 199, 1999 and 19999 as the argument
;;; , and you'll see the answer.



(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(newline)
(display (smallest-divisor 199))
;Value: 199

(newline)
(display (smallest-divisor 1999))
;Value: 1999

(newline)
(display (smallest-divisor 19999))
;Value: 7
