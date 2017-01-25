;;; Exercise 2.19
;;; =============

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins)
;Value: 292
(cc 100 uk-coins)
;Value: 104561

;; The order of coin-values doesn't affect the result, because the algorithm
;; doesn't require coin values to be in any specific order. The ways to make
;; change can always be divided into two groups: those that do not use any
;; of the first kind of coin, and those that do, no matter whether the first
;; one has the greatest denomination.
;; 
;; However, changing the order does affect the time required. Sorting coin-
;; values in descending order would lead to maximun efficiency.

