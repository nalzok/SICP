;;; Exercise 2.51
;;; =============

(define (below painter1 painter2)
  (let ((split-point (make-vector 0.0 0.5)))
   (let ((painter-bottom (transform-painter painter1
                                            (make-vector 0.0 0.0)
                                            (make-vector 1.0 0.0)
                                            split-point))
         (painter-top (transform-painter painter2
                                         split-point
                                         (make-vector 1.0 0.5)
                                         (make-vector 0.0 1.0))))
     (lambda (frame)
       (painter-bottom frame)
       (painter-top frame)))))

(define (below painter1 painter2)
  (rotate270 (beside (rotate90 painter2)
                     (rotate90 painter1))))

