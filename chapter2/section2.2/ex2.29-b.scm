;;; Exercise 2.29-b
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

(define (total-weight mobile)
  (let ((left (branch-structure (left-branch mobile)))
        (right (branch-structure (right-branch mobile))))
    (+ (if (list? left)
         (total-weight left)
         left)
       (if (list? right)
         (total-weight right)
         right))))

(define left (make-branch 1 2))
(define right (make-branch 3 4))
(define mobile (make-mobile left right))
(total-weight mobile)
;Value: 6

(define left-2 (make-mobile 5 mobile))
(define right-2 (make-mobile 6 42))
(define mobile-2 (make-mobile left-2 right-2))
(total-weight mobile-2)
;Value: 48

