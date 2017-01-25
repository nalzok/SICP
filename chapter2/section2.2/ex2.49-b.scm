;;; Exercise 2.49-b
;;; ===============

(define x-painter (let ((tl (make-vector 0.0 1.0))
                        (tr (make-vector 1.0 1.0))
                        (bl (make-vector 0.0 0.0))
                        (br (make-vector 1.0 0.0)))
                    (segment->painter (list (make-segment tl br)
                                            (make-segment tr bl)))))

