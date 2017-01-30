;;; Exercise 2.66
;;; =============

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
    false
    (let ((this (entry set-of-records))
          (left (left-branch set-of-records))
          (right (right-branch set-of-records)))
      (cond ((< given-key (key this)) (lookup given-key left))
            ((> given-key (key this)) (lookup given-key right))
            (else given-key)))))

