;;; Exercise 1.17
;;; =============

(define (fast-mult a b)
  (define (even? num)
    (= (remainder num 2) 0))
  (define (double num)
    (* num 2))
  (define (halve num)
    (/ num 2))
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(fast-mult 42 11)
;Value: 462
(fast-mult 11 42)
;Value: 462

