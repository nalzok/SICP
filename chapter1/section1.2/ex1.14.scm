;;; Exercise 1.14
;;; =============

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 11)
;Value: 4

;; Tree omitted
;; For your reference: http://sicp.readthedocs.io/en/latest/_images/14.png

;; Order of growth of space: theta of n
;;
;; Consider the case where only pennies are used, which produces the longest
;; chain.

;; Order of growth of number of steps: theta of n^5
;;
;; We can prove that, in general, the order of growth of number of steps
;; is theta of n^m, where m is the number of types of coin available. Here
;; is my (very) crude reasoning, which uses induction:
;;
;; (i)  When there is only one type of coin, the number of steps is obviously 
;; proportional to n.
;; (ii) Suppose it would take `(cc n m)` steps to change an amount of n
;; with m types of coin. Now consider `(cc n m+1)`:
;;
;;     (cc n m+1)
;;   = (cc n m) + (cc n-A m+1)
;;   = (cc n m) + (cc n-A m) + (cc n-2A m+1)
;;   = (cc n m) + (cc n-A m) + (cc n-2A m) + (cc n-3A m+1)
;;   = ......
;;
;;   , where A is the denomination of the mth kind of coin.
;;
;; , which eventually computes to 
;;
;;     (cc n m) + (cc n-A m) + ... + (cc <something negative> m+1)
;;
;; There are approximately n / A items. So the total number of steps would
;; be proportional to n / A * n^m, which is proportional to n^(m+1). Thus,
;; the order of growth for number of steps of `(cc n m)` is theta of n^m
;; in general.
;;
;; Let m be 5, and the order of growth of number of steps is theta of n^5.

