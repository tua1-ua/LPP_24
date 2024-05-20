#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 3a

(define (hojas-cumplen pred arbol)
  (cond
    ((hoja-arbol? arbol) (if (pred (dato-arbol arbol)) arbol '()))
    (else (hojas-cumplen-bosque pred (hijos-arbol arbol)))))

(define (hojas-cumplen-bosque pred bosque)
  (cond
    ((null? bosque) '())
    (else (append (hojas-cumplen pred (first bosque))
                  (hojas-cumplen-bosque pred (rest bosque))))))


;FOS
(define (hojas-cumplen-fos pred arbol)
  (cond
    ((hoja-arbol? arbol) (if (pred (dato-arbol arbol)) arbol '()))
    (else (foldr append '() (map (lambda (x) (hojas-cumplen-fos pred x)) (hijos-arbol arbol))))))




;Ejercicio 3b

(define arbol1 '(10 (2) (12 (4) (2)) (10 (5))))
(define arbol2 '(10 (2) (12 (4) (2)) (10 (6))))


(define (todas-hojas-cumplen? pred arbol)
  (cond
    ((hoja-arbol? arbol) (if (pred (dato-arbol arbol)) #t #f))
    (else 
     (todas-hojas-bosque-cumplen? pred (hijos-arbol arbol)))))

(define (todas-hojas-bosque-cumplen? pred bosque)
  (cond
    ((null? bosque) #t)
    (else (and (todas-hojas-cumplen? pred (first bosque))
               (todas-hojas-bosque-cumplen? pred (rest bosque))))))


(define (todas-hojas-cumplen-fos? pred arbol)
  (for-all? (lambda (x) (if (hoja? x) (pred x) #t)) (hijos-arbol arbol)))

  