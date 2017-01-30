;;; Exercise 2.69
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
  (if (= (length leaf-set) 1)
    (car leaf-set)
    (successive-merge (let ((first (car leaf-set))
                            (second (cadr leaf-set)))
                        (adjoin-set (make-code-tree first
                                                    second)
                                    (cddr leaf-set))))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))
(define generated-tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
(equal? sample-tree generated-tree)
;Value: #t

;; In this case, `generated-tree` is an exact duplicate of `sample-tree`, but
;; it is also possible that the tree produced by your procedure is different
;; from `sample-tree`, because as the text suggests, "the algorithm does not
;; always specify a unique tree".

