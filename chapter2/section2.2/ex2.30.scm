;;; Exercise 2.30
;;; =============

(define (square-tree tree)
  (cond ((null? tree)
         '())
        ((pair? tree)
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))
        (else
          (square tree))))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
;Value 13: (1 (4 (9 16) 25) (36 49))

;; Do this
(define (square-tree tree)
  (map (lambda (sub-tree)
          (if (pair? sub-tree)
            (square-tree sub-tree)
            (square sub-tree)))
        tree))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
;Value 14: (1 (4 (9 16) 25) (36 49))

;; Don't do this
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (let ((this (car sub-tree))
                 (rest (cdr sub-tree)))
             (cons (if (pair? this)
                     (square-tree this)
                     (square this))
                   (if (pair? rest)
                     (square-tree rest)
                     (square rest))))
           (square sub-tree)))
       tree))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
;Value 15: (1 (4 (9 16) 25) (36 49))

;; When using `map`, you should consider lists instead of pairs.

