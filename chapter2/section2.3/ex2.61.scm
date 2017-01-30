;;; Exercise 2.61
;;; =============

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= (car set) x) set)
        ((> (car set) x) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define x 3)
(define set '(1 2 4 5))
(adjoin-set x set)

;; Sometimes the recursion would stop near the beginning of the list while
;; other times we will still need to examine most of the list. Thus, only
;; half of the list would be iterated through on average.

