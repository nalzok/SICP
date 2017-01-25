;;; Exercise 2.50
;;; =============

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vector 1.0 0.0)
                     (make-vector 0.0 0.0)
                     (make-vector 1.0 1.0)))

(define (rotate180 painter)
  (transform-painter painter
                     (make-vector 1.0 1.0)
                     (make-vector 0.0 1.0)
                     (make-vector 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vector 0.0 1.0)
                     (make-vector 0.0 0.0)
                     (make-vector 1.0 1.0)))

