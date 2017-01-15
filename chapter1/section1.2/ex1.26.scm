;;; Exercise 1.26
;;; =============

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
  (try-it (+ 1 (random (- n 1)))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 1024)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display (* 1000 elapsed-time)))

(timed-prime-test 1009)
;1009 *** 20.

;; Louis Reasoner's implementation

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(timed-prime-test 1009)
;1009 *** 1820.

;; Observe that in Louis Reasoner's program, the procedure `expmod` calls
;; itself twice, which would results in four consequent calls to `expmod`
;; , which would invoke eight further calls... As a result, there would be
;; a total of 2^(log_2(n)), i.e. n calls, making `expmod` a theta-of-n
;; process.

