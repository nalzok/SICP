;;; Exercise 1.24
;;; =============

; TODO: write an iterative version
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  ; we're able to generate pseudorandom numbers in
  ; constant time with constant space. See this post:
  ; http://stackoverflow.com/a/40857499/5399734
  (try-it (+ 1 (random (- n 1)))))

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
  (display (* 1000 elapsed-time)))

(timed-prime-test 1009)
;1009 *** .02
(timed-prime-test 1013)
;1013 *** .02
(timed-prime-test 1019)
;1019 *** 3.0000000000000006e-2

(timed-prime-test 10007)
;10007 *** .03
(timed-prime-test 10009)
;10009 *** .01999999999999999
(timed-prime-test 10037)
;10037 *** .01999999999999999

(timed-prime-test 100003)
;100003 *** .01999999999999999
(timed-prime-test 100019)
;100019 *** .01999999999999999
(timed-prime-test 100043)
;100043 *** .04000000000000001

(timed-prime-test 1000003)
;1000003 *** 3.0000000000000027e-2
(timed-prime-test 1000033)
;1000033 *** .02999999999999997
(timed-prime-test 1000037)
;1000037 *** .03999999999999998

;; As the figures suggest, the time required to check whether n is prime
;; generally increases linearly as n is increased tenfold. This result is
;; compatible with the Fermat test's theta-of-log(n) order of growth.
;;
;; However, strangely, running a test for 100003 is 0.01 second faster
;; than testing 10007. I think this discrepancy is caused by the accuracy
;; of timing, since tests for larger numbers bear out the prediction nearly
;; perfectly. 

