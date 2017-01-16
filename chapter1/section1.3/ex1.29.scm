;;; Exercise 1.29
;;; =============

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

; n must be even
(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (integral-term k)
    (cond ((or (= k 0) (= k n))
           (f (+ (* k h) a)))
          ((even? k)
           (* 2 (f (+ (* k h) a))))
          (else
            (* 4 (f (+ (* k h) a))))))
  (define (next-k k)
    (+ k 1))
  (* (/ h 3.0)
     (sum integral-term 0 next-k n)))

(define (cube x)
  (* x x x))

(integral cube 0 1 100)
;Value: .25
(integral cube 0 1 1000)
;Value: .25

;; Thanks to Simpson's Rule, this version of `integral` is more accurate.
