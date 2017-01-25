;;; Exercise 2.49-c
;;; ===============

(define diamond (let ((b (make-vector 0.5 0.0))
                      (r (make-vector 1.0 0.5))
                      (t (make-vector 0.5 1.0))
                      (l (make-vector 0.0 0.5)))
                  (segment->painter (list (make-segment b r)
                                          (make-segment r t)
                                          (make-segment t l)
                                          (make-segment l b)))))

