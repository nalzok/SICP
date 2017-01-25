;;; Exercise 2.22
;;; =============

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things) 
            (cons (square (car things))
                  answer))))
  (iter items '()))

(square-list (list 1 2 3 4))
;Value 13: (16 9 4 1)

;; With `car`, you can only extract the "head" (i.e. leftmost item) of a
;; list; with `cons`, you can only put an item before the "head" of a list.
;; This means both the contruction and deconstruction of a list happen at
;; its "head". However, we need to add items after its "tail" (i.e. right-
;; most item). As a result, the answer list is in the reverse order of the
;; one desired.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                  (square (car things))))))
  (iter items '()))

(square-list (list 1 2 3 4))
;Value 14: ((((() . 1) . 4) . 9) . 16)

;; Arguments passed to `cdr` aren't interchangable. Doing this would cause
;; `cdr` to return a number and `car` to return a pair when called with the
;; answer. Consequently, the result returned doesn't satisfy the definition
;; of a list, which means this precedure doesn't even return a list.

