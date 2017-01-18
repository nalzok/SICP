;;; Exercise 2.4
;;; ============

(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

(define x "foo")
(define y "bar")

(car (cons x y))
;Value 13: "foo"

;; (car (cons x y))
;; (car (cons "foo" "bar"))
;; (car (lambda (m) (m "foo" "bar")))
;; ((lambda (m) (m "foo" "bar")) (lambda (p q) p))
;; ((lambda (p q) p) "foo" "bar")
;; "foo"

(cdr (cons x y))
;Value 14: "bar"

