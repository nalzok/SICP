;;; Exercise 1.36
;;; =============
;;;
;;; Average damping is another technique which is easy to apply (simply
;;; average the independent and dependent variables), but can make the
;;; procedure much more efficient, in many cases.
;;;
;;; However, note that `fixed-point` can only find "attractive fixed points"
;;; given that `first-guess` is in the neighbourhood of a fixed point. For
;;; example, let `f` be `(lambda (x) (* x 2))` and `first-guess` be any
;;; number other than 0, then `fixed-point` would enter an infinite loop,
;;; while 0 is an obvious fixed point in this case.
;;;
;;; For more information on fixed point, see:
;;;
;;; https://en.wikipedia.org/wiki/Fixed_point_(mathematics)



(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
     (if (close-enough? guess next)
       next
       (try next))))
  (try first-guess))

;; Without average damping
;;
(define (find-root)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 5.0))

(newline)
(display (find-root))
; Value:
; ......<29 steps>
; 4.555539314360711

;; With average damping
;;
(define (find-root)
  (fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 5.0))

(newline)
(display (find-root))
; Value:
; ......<9 steps>
; 4.5555361005218895

