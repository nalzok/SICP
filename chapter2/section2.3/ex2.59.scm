;;; Exercise 2.59
;;; =============

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (union-set set1 set2)
  (if (null? set1)
    set2
    (union-set (cdr set1)
               (adjoin-set (car set1) set2))))

(define set1 (list 1 2 3))
(define set2 (list 2 3 5))
(union-set set1 set2)
;Value 13: (1 2 3 5)

