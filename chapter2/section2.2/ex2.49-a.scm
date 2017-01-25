;;; Exercise 2.49-a
;;; ===============

(define outline (let ((tl (make-vector 0.0 1.0))
                      (tr (make-vector 1.0 1.0))
                      (bl (make-vector 0.0 0.0))
                      (br (make-vector 1.0 0.0)))
                  (segment->painter (list (make-segment tl tr)
                                          (make-segment tr br)
                                          (make-segment br bl)
                                          (make-segment bt tl)))))

