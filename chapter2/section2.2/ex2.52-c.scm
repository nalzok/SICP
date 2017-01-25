;;; Exercise 2.52-c
;;; ===============

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four rotate270 rotate180
                                  identity rotate90)))
    (combine4 (corner-split painter n))))

