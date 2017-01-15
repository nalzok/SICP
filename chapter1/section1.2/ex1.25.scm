;;; Exercise 1.25
;;; =============

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square num)
    (* num num))
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (- n 1) (* a b)))))
  (expt-iter b n 1))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 42)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(expmod 3 5 8)
;Value: 3
(fast-expt 42 1000000007)
;<time out>
(timed-prime-test 1000000007)
;<time out>

;; The question is: would this procedure serve as well for our fast prime
;; tester? Theoretically, yes; practically, no. This is because squaring
;; large integers can be very time-consuming. Thus, although the procedure
;; using `expmod` still has theta-of-log(n) order of growth, it would run
;; much slower than expected as n becomes tremendous.
;;
;; Quoting Footnote 36:
;; "...we are making the assumption that the number of machine operations
;; needed to perform, say, a multiplication is independent of the size of
;; the numbers to be multiplied, which is false if the numbers are suffi-
;; ciently large."
;;
;; This exercise shows us a good example on this issue.

