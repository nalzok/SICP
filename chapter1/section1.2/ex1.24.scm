;;; Exercise 1.24
;;; =============
;;;
;;; Test primality the probabilistic way. Althought it is possible that some
;;; large integers happen to be Carmichael numbers, we the engineers don't
;;; really about this, because the change is even lower than the chance that
;;; cosmic radiation will cause the computer to make an error in carrying
;;; out a ''correct'' algorithm. Actually, engineers would care more about
;;; protecting the computer from being affected by comsmic radiation.
;;;
;;; While using the Fermat method does affect the reliability of our program
;;; , this difference is marginal and thus ignorable. However, the boost on
;;; efficiency, that is, from sqrt(n) to log(n), is significant.



(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

; Tried to write an iterative version, but failed.
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1024) ; If n passes the test for 1024 random choices
                           ; of a, the chances are better than 2^1024-1 in
                           ; 2^1024 that n is prime.
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1000000007)
(timed-prime-test 10000000019)
(timed-prime-test 100000000003)
(timed-prime-test 1000000000039)
(timed-prime-test 10000000000037)
(timed-prime-test 100000000000031)
(timed-prime-test 1000000000000037)
(timed-prime-test 10000000000000061)
(timed-prime-test 100000000000000003)
(timed-prime-test 1000000000000000003)
(timed-prime-test 10000000000000000051)
(timed-prime-test 100000000000000000039)
(timed-prime-test 1000000000000000000117)
(timed-prime-test 10000000000000000000009)
(timed-prime-test 100000000000000000000117)
(timed-prime-test 1000000000000000000000007)
(timed-prime-test 10000000000000000000000013)
(timed-prime-test 100000000000000000000000067)
; I'm losing my patience, so I'm going to increase n more rapidly.
(newline)
(timed-prime-test 1000000000000000000000000000000000067)
(timed-prime-test 10000000000000000000000000000000000000000000121)
(timed-prime-test 100000000000000000000000000000000000000000000000000000003)
(timed-prime-test 1000000000000000000000000000000000000000000000000000000000000000049)
(timed-prime-test 10000000000000000000000000000000000000000000000000000000000000000000000000133)
(timed-prime-test 100000000000000000000000000000000000000000000000000000000000000000000000000000000000387)
(timed-prime-test 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000127)
; Value: 
; 1000000007 *** 0.
; 10000000019 *** 0.
; 100000000003 *** 0.
; 1000000000039 *** 0.
; 10000000000037 *** 0.
; 100000000000031 *** 0.
; 1000000000000037 *** 0.
; 10000000000000061 *** 1.0000000000000002e-2
; 100000000000000003 *** 1.0000000000000002e-2
; 1000000000000000003 *** 0.
; 10000000000000000051 *** 9.999999999999995e-3
; 100000000000000000039 *** 0.
; 1000000000000000000117 *** 1.0000000000000009e-2
; 10000000000000000000009 *** 9.999999999999995e-3
; 100000000000000000000117 *** 9.999999999999995e-3
; 1000000000000000000000007 *** 0.
; 10000000000000000000000013 *** 1.0000000000000009e-2
; 100000000000000000000000067 *** 9.999999999999995e-3
;
; 1000000000000000000000000000000000067 *** 9.999999999999995e-3
; 10000000000000000000000000000000000000000000121 *** 2.0000000000000018e-2
; 100000000000000000000000000000000000000000000000000000003 *** .01999999999999999
; 1000000000000000000000000000000000000000000000000000000000000000049 *** .04000000000000001
; 10000000000000000000000000000000000000000000000000000000000000000000000000133 *** .03
; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000387 *** .04000000000000001
; 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000127 *** .04999999999999999
;
; As the figures suggest, the time required to check whether n is prime
; merely increases linearly as n is increased tenfold. This result is
; compatible with the Fermat test's theta-of-log(n) order of growth.
;
; There are almost no discrepancy found in this experiment.

