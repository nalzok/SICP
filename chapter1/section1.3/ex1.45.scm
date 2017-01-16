;;; Exercise 1.45
;;; =============

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
     (if (close-enough? guess next)
       next
       (try next))))
  (try first-guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average v1 v2)
  (/ (+ v1 v2)
     2.0))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

; Copied from ex1.16.scm
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

; n is expected to be a positive integer
(define (nth-root n x)
  (fixed-point-of-transform (lambda (y) (/ x (fast-expt y (- n 1))))
                            (repeated average-damp (times-required n))
                            1.0))

;;------------------------------------------
;;
;;     Procedure used for the experiment
;;
;; (define (ith-root-until-n n x)
;;   (define (iter i)
;;     (cond ((> i n) (newline))
;;           (else
;;             (newline)
;;             (display i)
;;             (display "th ")
;;             (display (nth-root i x))
;;             (iter (+ i 1)))))
;;   (iter 1))
;;
;; (ith-root-until-n 100 42)
;;
;;------------------------------------------
;;
;;         Result of the experiment
;;
;; |--------------------------------------|
;; | time of `average- | highest order of |
;; | damp` applied     | root can compute |
;; |--------------------------------------|
;; |                 1 |                3 |
;; |                 2 |                7 |
;; |                 3 |               15 |
;; |                 4 |               31 |
;; |                 5 |               63 |
;; |--------------------------------------|
;;
;; Conclusion: At least log_2(order) times of average daumping is required.
;;
;;------------------------------------------

(define (times-required n)
  (if (= n 1)
    1
    (floor (/ (log n) (log 2)))))

(nth-root 7 42)
;Value: 1.7056578181160351

