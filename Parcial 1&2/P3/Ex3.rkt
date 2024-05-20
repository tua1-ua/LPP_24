#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 3a.1

(define p1 (list (cons 'a 'b) 'c (list 'd 'e)))

;Ejercicio 3a.2
;Para devolver b

(cdr (first p1))

;Para devolver d

(first (third p1))


;Ejercicio 3b.1

(define p2 (list (list (cons 'a (cons 'b 'c)) (list 'd 'e) 'f) 'g))

;Ejercicio 3b.2

;Para devolver c

(cdr (cdr(first (first p2))))


;Para devolver e

(second (second (first p2)))
