;;; Exercise 2.70
;;; =============

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))
(define (encode-symbol symbol branch)
  (if (leaf? branch)
    '()
    (let ((left (left-branch branch))
          (right (right-branch branch)))
      (cond ((element-of-set? symbol (symbols left))
             (cons 0 (encode-symbol symbol left)))
            ((element-of-set? symbol (symbols right))
             (cons 1 (encode-symbol symbol right)))
            (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))))
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((eq? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
     (adjoin-set (make-leaf (car pair)    ; symbol
                            (cadr pair))  ; frequency
                 (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge leaf-set)
  (if (or (null? leaf-set) (null? (cdr leaf-set)))
    (car leaf-set)
    (successive-merge (let ((first (car leaf-set))
                            (second (cadr leaf-set)))
                        (adjoin-set (make-code-tree first
                                                    second)
                                    (cddr leaf-set))))))

(define tree (generate-huffman-tree '((A    2) (NA 16)
                                      (BOOM 1) (SHA 3)
                                      (GET  2) (YIP 9)
                                      (JOB  2) (WAH 1))))
(define huff-code (encode '(Get a job
                            Sha na na na na na na na na
                            Get a job
                            Sha na na na na na na na na
                            Wah yip yip yip yip yip yip yip yip yip
                            Sha boom) tree))
(length huff-code)
;Value: 84

;; Eighty four bits are required for the encoding. If we used a fixed-length
;; code for the eight-symbol alphabet to encode this song, at least 36*3=108
;; bits are required. Huffman coding has great advantage over fixed-length
;; coding when the message to be encoded contains much redundancy.

