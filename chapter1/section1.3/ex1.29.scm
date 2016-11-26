;;; Exercise 1.29
;;; =============
;;;
;;; Define a procedure that takes as arguments f, a, b, and n and returns
;;; the value of the integral, computed using Simpson's Rule.
;;;
;;; This exercise isn't very hard if you follow the examples provided by
;;; the book.

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (integral-term k)
    (cond ((or (= k 0) (= k n))
           (f (+ (* k h) a)))
          ((even? k)
           (* (f (+ (* k h) a)) 2))
          (else
            (* (f (+ (* k h) a)) 4))))
  (define (next-k k)
    (+ k 1))
  (* (/ h 3.0) (sum integral-term 0 next-k n)))

(define (cube x)
  (* x x x))

(newline)
(display (integral cube 0 1 100))
;Value: .25
(newline)
(display (integral cube 0 1 1000))
;Value: .25

