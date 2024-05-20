#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 4a

(define (suma-raices-hijos arbol)
  (foldr + 0 (map dato-arbol (hijos-arbol arbol))))


;Ejercicio 4b

(define (raices-mayores-arbol? arbol)
    (and (> (dato-arbol arbol) (suma-raices-hijos arbol))
         (raices-mayores-bosque? (hijos-arbol arbol))))

(define (raices-mayores-bosque? bosque)
  (cond
    ((null? bosque) #t)
    (else (and (raices-mayores-arbol? (first bosque))
               (raices-mayores-bosque? (rest bosque))))))

(define (raices-mayores-arbol-fos? arbol)
  (and (> (dato-arbol arbol) (suma-raices-hijos arbol))
       (for-all? raices-mayores-arbol-fos? (hijos-arbol arbol))))

(define arbol3 '(20 (2) (8 (4) (2)) (9 (5))))


;Ejercicio 4c

(define (si-mayor-1-sino-0 pred)
  (if (equal? #t pred) 1 0))

(define (comprueba-raices-arbol arbol)
  (construye-arbol (si-mayor-1-sino-0 (> (dato-arbol arbol) (suma-raices-hijos arbol)))
        (comprueba-raices-bosque (hijos-arbol arbol))))
  

(define (comprueba-raices-bosque bosque)
  (cond
    ((null? bosque) '())
    (else (cons (comprueba-raices-arbol (first bosque))
                  (comprueba-raices-bosque (rest bosque))))))


(define (comprueba-raices-arbol-fos arbol)
  (construye-arbol (si-mayor-1-sino-0 (> (dato-arbol arbol) (suma-raices-hijos arbol)))
                   (map comprueba-raices-arbol-fos (hijos-arbol arbol))))
 

(check-equal? (comprueba-raices-arbol '(20 (2) (8 (4) (5)) (9 (5)))) '(1 (1) (0 (1) (1)) (1 (1))))
(check-equal? (comprueba-raices-arbol-fos '(20 (2) (8 (4) (5)) (9 (5)))) '(1 (1) (0 (1) (1)) (1 (1))))
(check-equal? (comprueba-raices-arbol arbol3) '(1 (1) (1 (1) (1)) (1 (1))))
(check-equal? (comprueba-raices-arbol-fos arbol3) '(1 (1) (1 (1) (1)) (1 (1))))







