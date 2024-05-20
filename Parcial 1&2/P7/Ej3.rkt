#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 3


(define (cumplen-predicado pred lista)
  (cond
    ((null? lista) '())
    ((hoja? lista) (if (pred lista) (list lista) '()))
    (else (append (cumplen-predicado pred (first lista))
                  (cumplen-predicado pred (rest lista))))))


(define (cumplen-predicado-fos pred lista)
  (cond
    ((hoja? lista) (if (pred lista) (list lista) '()))
    (else
     (foldr append '() 
     (map (lambda (x) (cumplen-predicado-fos pred x)) lista)))))

;Busca-mayores

(define (busca-mayores n lista-num)
  (cumplen-predicado (lambda (x) (> x n)) lista-num))


;Empieza-por

(define (empieza-por char lista-pal)
  (cumplen-predicado-fos (lambda (x) (equal? char (string-ref (symbol->string x) 0))) lista-pal))