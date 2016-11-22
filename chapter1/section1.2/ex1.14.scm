;;; Exercise 1.14
;;; =============
;;;
;;; I've drawn the tree on paper, but I'm too lazy to type the whole tree into
;;; my computer. Anyway, drawing the tree is not very hard, so I don't think
;;; typing it down would worth the effort.
;;; For your reference: http://sicp.readthedocs.io/en/latest/_images/14.png
;;;
;;; Order of growth of space: theta of n
;;; ------------------------------------
;;; Consider the case where only pennies are used, which produces the longest
;;; chain.
;;;
;;; Order of growth of number of steps: theta of n^5
;;; ------------------------------------------------
;;; We can prove that, in general, the order of growth of number of steps
;;; is theta of n^m, where m is the number of types of coin available. Here
;;; is my (very) crude reasoning, which uses induction:
;;;
;;; * When there is only one type of coin, the number of steps is obviously 
;;; proportional to n.
;;; * Suppose it would take `(cc n m)` steps to change an amount of n
;;; with m types of coin. `(cc n m)` approximately equals to 
;;;
;;;     (cc n    m-1) + (cc n    m-2) + ... + (cc n    1)
;;;   + (cc n-A  m-1) + (cc n-A  m-2) + ... + (cc n-A  1)
;;;   + (cc n-2A m-1) + (cc n-2A m-2) + ... + (cc n-2A 1)
;;;   + ......
;;;   + (cc <something negative> m-1) + ... + (cc <something negative> 1)
;;;   , where A is the denomination of the mth kind of coin.
;;;
;;; In the matrix above, the number of rows should be proportional to n, and
;;; since `(cc n m-1)` is proportional to n^(m-1), `(cc n m)` is proportional
;;; to n*n^(m-1), i.e. n^m.



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

(newline)
(display (count-change 11))
;Value: 4

