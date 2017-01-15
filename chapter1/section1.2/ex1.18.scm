;;; Exercise 1.18
;;; =============

(define (fast-mult a b)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (double n)
    (* n 2))
  (define (halve n)
    (/ n 2))
  (define (mult-iter a b p)
    (cond ((= b 0) p)
          ((even? b) (mult-iter (double a) (halve b) p))
          (else (mult-iter a (- b 1) (+ p a)))))
  (mult-iter a b 0))

(fast-mult 6 7)
;Value: 42
(fast-mult 7 6)
;Value: 42

