;;; Exercise 1.23
;;; =============
;;;
;;; Nearly one half of the tests are skipped after this modification. In 
;;; fact, we only need to test prime numbers as divisors, but testing if
;;; a divisor is prime is not very easy. Anyway, the purpose of the whole
;;; program is to check primality.



(define (next former-divisor)
  (if (= former-divisor 2)
    3
    (+ former-divisor 2)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
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

; Value:
; 1000000007 *** .01
; 10000000019 *** .06
; 100000000003 *** .19000000000000003
; 1000000000039 *** .6200000000000001
; 10000000000037 *** 1.9699999999999998
; 100000000000031 *** 6.2299999999999995
; 1000000000000037 *** 19.43
;
; Output of the process without using `next`:
; 1000000007 *** .03
; 10000000019 *** .09999999999999999
; 100000000003 *** .31999999999999995
; 1000000000039 *** 1.02
; 10000000000037 *** 3.08
; 100000000000031 *** 9.88
; 1000000000000037 *** 30.9
;
; Compare the outputs above, we can see that (on my machine) the observed
; ratio of the speeds of the two algorithms is about 3:2. I think what makes
; it less than 2 is the fact that calling an extra function and doing extra
; comparison requires extra time, which partially cancels out the time saved.

