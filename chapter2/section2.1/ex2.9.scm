;;; Exercise 2.9
;;; ============

;; Addition:
;;
;; [a, b] + [c, d] = [a + b, c + d]
;; width([a, b]) = (a + b) / 2
;; width([c, d]) = (c + d) / 2
;; width([a + b, c + d]) = (a + b + c + d) / 2
;;                       = width([a, b]) + width([c, d])

;; Subtraction:
;;
;; [a, b] - [c, d] = [a - d, b - c]
;; width([a, b]) = (a + b) / 2
;; width([c, d]) = (c + d) / 2
;; width([a - d, b - c]) = (a + b - c - d) / 2
;;                       = width([a, b]) - width([c, d])

;; Multiplication:
;;
;;        [1, 3] * [1, 3] = [1, 9]
;; width:  1        1        4
;;        [2, 4] * [2, 4] = [4, 16]
;; width:  1        1        6

;; Division:
;;
;;        [1, 3] / [1, 3] = [1/3, 3]
;; width:  1        1        4/3
;;        [2, 4] / [2, 4] = [1/2, 2]
;; width:  1        1        3/4

