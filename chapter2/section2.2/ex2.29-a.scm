;;; Exercise 2.29-a
;;; ===============

(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

(define left (make-branch 1 2))
(define right (make-branch 3 4))
(define mobile (make-mobile left right))

(left-branch mobile)
;Value 13: (1 2)
(right-branch mobile)
;Value 14: (3 4)
(branch-length left)
;Value: 1
(branch-structure right)
;Value: 4

