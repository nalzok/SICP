;;; Exercise 2.39
;;; =============

(define x (list 1 2 3 4))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))
(reverse x)
;Value 13: (4 3 2 1)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
(reverse x)
;Value 14: (4 3 2 1)

