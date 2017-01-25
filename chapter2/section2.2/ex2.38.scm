;;; Exercise 2.38
;;; =============

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
;Value: 3/2
(fold-left / 1 (list 1 2 3))
;Value: 1/6
(fold-right list '() (list 1 2 3))
;Value 13: (1 (2 (3 ())))
(fold-left list '() (list 1 2 3))
;Value 14: (((() 1) 2) 3)

;; Commutativity, i.e. (op opd1 opd2) == (op opd2 opd1)

