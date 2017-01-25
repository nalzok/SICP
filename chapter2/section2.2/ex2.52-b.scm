;;; Exercise 2.52-b
;;; ===============

(define (corner-split painter n)
  (if (= n 0)
    painter
    (let ((top-left (up-split painter (- n 1)))
          (bottom-right (right-split painter (- n 1)))
          (corner (corner-split painter (- n 1))))
      (beside (below painter top-left)
              (below bottom-right corner)))))

