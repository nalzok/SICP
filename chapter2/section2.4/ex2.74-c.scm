;;; Exercise 2.74-c
;;; ===============

(define (find-employee-record name files)
  (if (null? files)
    false
    (let ((result (get-record name (car files))))
     (if result
       result
       (find-employee-record name (cdr files))))))

