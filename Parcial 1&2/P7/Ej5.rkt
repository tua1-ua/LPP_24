#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 5a

(define (mezclar lista1 lista2 n)
  (cond
    ((null? lista1) '())
    ((hoja? lista1) (if (< n 0 )
         lista2 lista1))
    (else (cons (mezclar (first lista1) (first lista2) (- n 1))
                (mezclar (rest lista1) (rest lista2) n)))))



(define lista1 '(((a b) ((c))) (d) e))
(define lista2 '(((1 2) ((3))) (4) 5))


;Ejercicio 5b

(define (suma-1 par)
  (cons (car par) (+ 1 (cdr par))))

(define (selec-mayor p1 p2)
  (if (or (null? p2) (> (cdr p1) (cdr p2))) p1 p2))

(define (nivel-elemento lista)
  (cond
    ((null? lista) '())
    ((hoja? lista) (cons lista 0))
    (else (selec-mayor (suma-1 (nivel-elemento (first lista)))
                       (nivel-elemento (rest lista))))))