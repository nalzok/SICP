;;; Exercise 2.63
;;; =============

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

;; Q: Do the two procedures produce the same result for every tree? If not,
;;    how do the results differ? What lists do the two procedures produce for
;;    the trees in figure 2.16?
;;
;; A: Results produced the two procedures are identical for every trees. Their
;;    only difference is that `tree->list-1` is recursive while `tree->list-2`
;;    is iterative. It's worth noting that the list produced is always ordered.

(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(tree->list-1 tree1)
;Value 13: (1 3 5 7 9 11)
(tree->list-2 tree1)
;Value 14: (1 3 5 7 9 11)
(define tree2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(tree->list-1 tree2)
;Value 15: (1 3 5 7 9 11)
(tree->list-2 tree2)
;Value 16: (1 3 5 7 9 11)
(define tree3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))
(tree->list-1 tree3)
;Value 17: (1 3 5 7 9 11)
(tree->list-2 tree3)
;Value 18: (1 3 5 7 9 11)

;; Q: Do the two procedures have the same order of growth in the number of
;;    steps required to convert a balanced tree with n elements to a list?
;;    If not, which one grows more slowly?
;;
;; A: We can see that the order of growth of number of steps of `tree->list-2`
;;    is theta of n, where n stands for the number of nodes in a tree. This is
;;    because when the number of nodes of a tree becomes a+b+1 (combining one
;;    a-node trees, one b-node tree and an entry into one a+b+1-node tree), the
;;    number of steps required would also become T_a+T_b+1 (T_a for flating the
;;    a-node tree, T_b for flating the b-node tree, plus one unit for the extra
;;    conditioning and function calls, which is also exactly the time required
;;    to converting a single-node tree to a single-item list).
;;
;;    The order of growth of `tree->list-1` seems (highly) dependent on the
;;    shape of the tree (at least theta of n, when all left branches are nil,
;;    and at most theta of n^2, when all right branches are nil). Thus, I can't
;;    make an estimation without knowing the shape.
;;
;;    However, we can still see that `tree->list-1` grows more slowly, because
;;    it uses `append`, whose order of growth is theta-of-n. On the other hand,
;;    `tree->list-2` directly attaches elements from `(left-branch tree)` to
;;    the beginning of the resultant list, making it more efficient.

