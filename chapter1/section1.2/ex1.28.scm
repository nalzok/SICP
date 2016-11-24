;;; Exercise 1.28
;;; =============
;;;
;;; Don't forget that the cases where n equals one or two need to be handled
;;; seperately. Also, you can (and should) filter out even numbers in the
;;; first place. I defined a procedure called `prime-pretest`, so that these
;;; testings are carried out only once, rather than 1024 times.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime-pretest n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime-pretest n)
  (cond ((= n 1) #f)
        ((= n 2) #t)
        ((even? n) #f)
        (else
          (fast-prime? n 1024))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (fast-prime? n (- times 1)))
        (else #f)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ (random (- n 2)) 2)))

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
    0 ; Returning a zero here would cause `expmod` to return a zero.
    sqrt))

(timed-prime-test 2)
(timed-prime-test 31)
(timed-prime-test 561)
(timed-prime-test 1000000000000000000000000000000000067)
(timed-prime-test 10000000000000000000000000000000000000000000121)
(timed-prime-test 100000000000000000000000000000000000000000000000000000003)
(timed-prime-test 1000000000000000000000000000000000000000000000000000000000000000049)
(timed-prime-test 10000000000000000000000000000000000000000000000000000000000000000000000000133)
(timed-prime-test 100000000000000000000000000000000000000000000000000000000000000000000000000000000000387)
(timed-prime-test 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000127)
; Value:
; 2 *** 0.
; 31 *** .02
; 561
; 1000000000000000000000000000000000067 *** .41
; 10000000000000000000000000000000000000000000121 *** .5900000000000001
; 100000000000000000000000000000000000000000000000000000003 *** .71
; 1000000000000000000000000000000000000000000000000000000000000000049 *** .94
; 10000000000000000000000000000000000000000000000000000000000000000000000000133 *** 1.12
; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000387 *** 1.3200000000000003
; 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000127 *** 1.63
;
; Again, this procedure has theta-of-log(n) order of growth, because the 
; time required increases linearly as n grows geometrically .

