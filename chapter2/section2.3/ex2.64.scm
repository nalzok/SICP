;;; Exercise 2.64
;;; =============

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
     (let ((left-result (partial-tree elts left-size)))
      (let ((left-tree (car left-result))
            (non-left-elts (cdr left-result))
            (right-size (- n (+ left-size 1))))
        (let ((this-entry (car non-left-elts))
              (right-result (partial-tree (cdr non-left-elts)
                                          right-size)))
          (let ((right-tree (car right-result))
                (remaining-elts (cdr right-result)))
            (cons (make-tree this-entry left-tree right-tree)
                  remaining-elts))))))))

;; Q: Write a short paragraph explaining as clearly as you can how `partial-
;;    tree` works.
;;
;; A: When n reaches 0, the constructed tree is merely an empty node, and all
;;    elements passed in are unused elements.
;;
;;    When n is positive, the tree is constructed by combining `left-result`,
;;    a tree containing the first half of the elements, `right-result`, a tree
;;    containing the second half of the elements, and `this-entry`, the very
;;    middle element.
;;
;;    Since the list passed as argument is always ordered, the tree returned
;;    satisfies the requirement that "all elements in the left subtree are
;;    smaller than the node entry and that all elements in the right subtree
;;    are larger".

;; Q: Draw the tree produced by `list->tree` for the list `(1 3 5 7 9 11)`.
;;
;; A: (list->tree '(1 3 5 7 9 11))
;;    ;Value 13: (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;;    
;;                                  5
;;                                 / \
;;                                /   \
;;                               /     \
;;                              1       9
;;                               \     / \
;;                                3   7   11

;; Q: What is the order of growth in the number of steps required by `list->
;;    tree` to convert a list of n elements?
;;
;; A: It's theta of n, because when the length of the operand extends to 2n+1,
;;    the time required would also become 2T+1.

