;;; Exercise 1.28
;;; =============

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square 
                      (nontrivial-square-root?
                        (expmod base (/ exp 2) m) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))
(define (nontrivial-square-root? sqrt n)
  (if (and (= (remainder (square sqrt) n) 1)
           (not (= sqrt 1))
           (not (= sqrt (- n 1))))
    0 ; Returning 0 here would cause `expmod` to return 0, ending all tests.
    sqrt))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ (random (- n 1)) 1)))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (fast-prime? n (- times 1)))
        (else #f)))
(define (prime-test-starter n)
  (cond ((= n 1) #f)
        ((= n 2) #t)
        ((even? n) #f)
        (else
          (fast-prime? n 1024))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime-test-starter n)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 2)
;2 *** 0.
(timed-prime-test 3)
;3 *** 0.
(timed-prime-test 31)
;31 *** .01
(timed-prime-test 561)
;<no output>
(timed-prime-test 1000000007)
;1000000007 *** .08

