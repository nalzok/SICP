;;; Exercise 2.13
;;; =============

;; Assuming that all numbers are positive
;;
;; c1 ± p1 = [(1-p1)c1, (1+p1)c1]
;; c2 ± p2 = [(1-p2)c2, (1+p2)c2]
;;
;; (c1 ± p1) * (c2 ± p2) = [(1-p1) (1-p2) c1c2, (1+p1) (1+p2) c1c2]
;;                       = [(1-p1-p2+p1p2)c1c2, (1+p1+p2+p1p2)c1c2]
;;
;; Since p1 and p2 are "small percentage tolerances", p1 * p2 is smaller
;; than small and thus ignorable. So obviously, the simple formula for the
;; approximate percentage tolerance of the product of two intervals in
;; terms of the tolerances of the factors is:
;;
;;                              p' = p1 + p2

