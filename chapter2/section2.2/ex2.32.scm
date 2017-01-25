;;; Exercise 2.32
;;; =============

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
     (append rest (map (lambda (x)
                         (cons (car s) x))
                       rest)))))

(subsets (list 1 2 3))
;Value 13: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;; + If `s` is '(), it's subset is '()
;; + If `s` isn't '(), it's subset is the union of
;;   - the subsets of all but the first element of `s`, and
;;   - subsets of `s` containing its first element.
;;
;; Let `rest` be the subsets of all but the first element of `s`, then subsets
;; of `s` containing its first element would just be {{first_element} ∪ s | s
;; ∈ rest}.

