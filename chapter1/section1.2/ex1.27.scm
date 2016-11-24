;;; Exercise 1.27
;;; =============
;;;
;;; There are some numbers, called "Carmichael numbers", which can fool the
;;; Fermat test. Carmichael numbers become less dense as the number grows
;;; , so the Fermat test may not be that reliable when testing primality of
;;; relatively small numbers, 



(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fast-prime? n)
  (define (fast-prime-iter counter)
    (cond ((= counter n) #t)
          ((fermat-test n counter)
           (fast-prime-iter (+ counter 1)))
          (else #f)))
  (fast-prime-iter 1))

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
  (if (fast-prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 561)
(timed-prime-test 1105)
(timed-prime-test 1729)
(timed-prime-test 2465)
(timed-prime-test 2821)
(timed-prime-test 6601)
; Value:
; 561 *** .01
; 1105 *** 9.999999999999998e-3
; 1729 *** .04000000000000001
; 2465 *** .04999999999999999
; 2821 *** .05000000000000002
; 6601 *** .12999999999999998
; 
; 
; The `***`s printed indicates that `timed-prime-test` judges these numbers
; as prime, while in fact they aren't. For example, 561 = 3 * 11 * 17.
;
; By the way, the order of growth of this procedure is theta of  n*log(n).

