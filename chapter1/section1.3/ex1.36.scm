;;; Exercise 1.36
;;; =============

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
     (if (close-enough? guess next)
       next
       (try next))))
  (try first-guess))

;; Without average damping

(define (find-root)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 5.0))

(find-root)
;5.
;4.29202967422018
;4.741863119908242
;4.438204569837609
;4.635299887107611
;4.50397811613643
;4.589989462723705
;4.53301150767844
;4.570475672855484
;4.545720389670642
;4.562024936588171
;4.551263234080531
;4.55835638768598
;4.553676852183342
;4.55676216434628
;4.554727130670954
;4.556069054770006
;4.555184018843625
;4.5557676565438205
;4.555382746639082
;4.55563658243586
;4.555469180245326
;4.555579577900997
;4.5555067722873686
;4.5555547860484085
;4.555523121789556
;4.555544003742869
;4.555530232469306
;Value: 4.555539314360711

;; With average damping

(define (find-root)
  (fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 5.0))

(find-root)
;5.
;4.64601483711009
;4.571611286076025
;4.558294317536066
;4.556006022881116
;4.555615799731297
;4.555549342575593
;4.555538027101999
;Value: 4.5555361005218895


;; Futher reading on average damping:
;;
;; http://stackoverflow.com/q/3860929/5399734
;;
;; Please also note that `fixed-point` can only find "attractive fixed points"
;; , given that `first-guess` is in the neighbourhood of a fixed point. As an
;; example, let `f` be `(lambda (x) (* x 2))` and `first-guess` be any number
;; other than 0, then `fixed-point` would enter an infinite loop, while 0 is
;; an obvious fixed point in this case.
;;
;; For more information on fixed point, see:
;;
;; https://en.wikipedia.org/wiki/Fixed_point_(mathematics)

