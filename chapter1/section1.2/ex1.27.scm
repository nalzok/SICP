;;; Exercise 1.27
;;; =============

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

; Order of growth of space:           theta of log(n)
; Order of growth of number of steps: theta of n*log(n)
(define (fast-prime? n)
  (define (fast-prime-iter counter)
    (cond ((= counter n) #t)
          ((fermat-test n counter)
           (fast-prime-iter (+ counter 1)))
          (else #f)))
  (fast-prime-iter 1))
(define (fermat-test n a)
  (= (expmod a n n) a))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 561)
;561 *** .01
(timed-prime-test 1105)
;1105 *** 1.9999999999999997e-2
(timed-prime-test 1729)
;1729 *** .03
(timed-prime-test 2465)
;2465 *** .04000000000000001
(timed-prime-test 2821)
;2821 *** .04999999999999999
(timed-prime-test 6601)
;6601 *** .13000000000000003

;; The `***`s printed indicates that `timed-prime-test` judges these numbers
;; as prime, while in fact they aren't. For example, 561 = 3 * 11 * 17. So
;; these numbers really do fool the Fermat test.

