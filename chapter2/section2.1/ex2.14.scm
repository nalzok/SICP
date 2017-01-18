;;; Exercise 2.14
;;; =============

(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
   (div-interval one
                 (add-interval (div-interval one r1)
                               (div-interval one r2)))))

(define r1 (make-center-percent 6.8 1))
(define r2 (make-center-percent 4.7 5))
(print-center-percent (div-interval r1 r1))
;1.0002000200020003±1.9998000199979908%
(print-center-percent (div-interval r1 r2))
;1.4511598144296913±5.99700149925037%
(print-center-percent (par1 r1 r2))
;2.7868480947957286±8.618166719166128%
(print-center-percent (par2 r1 r2))
;2.7780551051882965±3.367539871356596%

