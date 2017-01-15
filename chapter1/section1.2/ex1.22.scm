;;; Exercise 1.22
;;; =============

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
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

(define (search-for-primes from to)
  (cond ((> from to) 0)
        ((even? from) ; Even numbers are definitely not prime
                      ; so let's skip them for extra efficiency.
         (search-for-primes (+ from 1) to))
        (else
          (timed-prime-test from)
          (search-for-primes (+ from 2) to))))

(search-for-primes 1000 1100)
(search-for-primes 10000 10100)
(search-for-primes 100000 100100)
(search-for-primes 1000000 1000100)
; Value: (not all of the output is listed here)
; 1009 *** 0.
; 1013 *** 0.
; 1019 *** 0.
; 10007 *** 0.
; 10009 *** 0.
; 10037 *** 0.
; 100003 *** 0.
; 100019 *** 0.
; 100043 *** 0.
; 1000003 *** 0.
; 1000033 *** 0.
; 1000037 *** 0.

;; Well, processors are so powerful nowadays that the time consumed is too
;; short to be calculated. I've tested some larger integers to make the timing
;; data significant enough:
;;
;; 1000000007 *** .03
;; 10000000019 *** .09999999999999999
;; 100000000003 *** .31999999999999995
;; 1000000000039 *** 1.02
;; 10000000000037 *** 3.08
;; 100000000000031 *** 9.88
;; 1000000000000037 *** 30.9

;; Answering questions
;;
;; Q: Since the testing algorithm has order of growth of (n), you should
;;    expect that testing for primes around 10,000 should take about 10
;;    times as long as testing for primes around 1000. Do your timing data
;;    bear this out?
;; A: Yes. sqrt(10) is approximately 3.16, and the timing data is tripled
;;    when testing a integer which is 10 times larger.
;; 
;; Q: How well do the data for 100,000 and 1,000,000 support the sqrt(n)
;;    prediction?
;; A: Both is computed almost instantly, so let's consider 100,000,000,000
;;    and 100,000,000,000,000 instead. On my MacBook Air Early 2015, these
;;    calculations took .31999999999999995 and 9.88 seconds respectively,
;;    which supports the sqrt(n) prediction quite well.
;;
;; Q: Is your result compatible with the notion that programs on your
;;    machine run in time proportional to the number of steps required for
;;    the computation?
;; A: Yes, at least it seems so.

