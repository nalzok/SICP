;;; Exercise 2.72
;;; =============

;; In the special case where the relative frequencies of the n symbols are
;; as described in exercise 2.71, the order of growth of the number of steps
;; needed to encode the most frequent symbol is at best theta of one, and at
;; worst theta of n, depending on which branch is searched first.
;;
;; The order of growth of number of steps required to encode the least fre-
;; quent symbol is at best theta of n, and at worst theta of n^2, depending
;; on whether and how the symbol list in each node is ordered.
;;
;; I think we can conclude that, in the general case, the order of growth of
;; the number of steps needed to encode a symbol is at least theta of one, and
;; at most theta of n^2, depending on the frequency of the symbol and the shape
;; of the Huffman tree.

