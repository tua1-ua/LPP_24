#lang racket
(require rackunit)

(define (menor-de-tres n1 n2 n3)
  (cond
    ((and (< n1 n2) (< n1 n3)) n1)
    ((and (< n2 n3) (< n2 n1)) n2)
    (else n3)))


(define (menor x y)
  (cond
    ((<= x y) x)
    (else y)))

(define (menor-de-tres-v2 n1 n2 n3)
  (menor n3 (menor n1 n2)))

(menor-de-tres 2 8 1) ;; ⇒ 1
(menor-de-tres-v2 3 0 3) ;; ⇒ 0
(check-equal? (menor-de-tres 2 8 1) 1)
(check-equal? (menor-de-tres 8 2 1) 1)
(check-equal? (menor-de-tres 2 1 8) 1)
(check-equal? (menor-de-tres 8 1 2) 1)
(check-equal? (menor-de-tres 1 8 2) 1)
(check-equal? (menor-de-tres 1 2 8) 1)

(check-equal? (menor-de-tres-v2 3 0 3) 0)
(check-equal? (menor-de-tres-v2 0 3 3) 0)
(check-equal? (menor-de-tres-v2 3 3 0) 0)
(check-equal? (menor-de-tres-v2 3 5 3) 3)
(check-equal? (menor-de-tres-v2 5 3 3) 3)
(check-equal? (menor-de-tres-v2 3 3 5) 3)