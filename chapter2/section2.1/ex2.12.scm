;;; Exercise 2.12
;;; =============

(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (make-center-percent c p)
  (let ((w (* c p 0.01)))
   (make-interval (- c w)
                  (+ c w))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (let ((width (/ (- (upper-bound i) (lower-bound i)) 2)))
   (abs (* (/ width (center i)) 100.))))

(define (print-center-percent i)
  (newline)
  (display (center i))
  (display "±")
  (display (percent i))
  (display "%"))

(define i (make-center-percent 3.5 5))
(print-center-percent i)
;3.5±4.999999999999995%

