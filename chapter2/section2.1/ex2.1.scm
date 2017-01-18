;;; Exercise 2.1
;;; ============

(define (make-rat n d)
  ; fortunately, gcd can handle negative numbers
  (let ((g (gcd n d)))
   (if (negative? d)
     (cons (/ (- n) g) (/ (- d) g))
     (cons (/ n g) (/ d g))))))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define negative-one-half (make-rat 1 -2))
(print-rat negative-one-half)
;-1/2

