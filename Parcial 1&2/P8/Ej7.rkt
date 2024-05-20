#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 7a

(define arbolb '(9 (5 (3 (1 () ())
                          (4 () ()))
                       (7 () ()))
                    (15 (13 (10 () ())
                            (14 () ()))
                        (20 ()
                            (23 () ())))))

(define (camino-arbolb arbolb camino)
  (cond
    ((or (null? camino)(vacio-arbolb? arbolb)) '())
    ((hoja-arbolb? arbolb) (if (equal? '= (first camino)) (list (dato-arbolb arbolb)) '()))
    ((equal? '< (first camino)) (camino-arbolb (hijo-izq-arbolb arbolb) (rest camino)))
    ((equal? '> (first camino)) (camino-arbolb (hijo-der-arbolb arbolb) (rest camino)))
    (else (cons (dato-arbolb arbolb) (camino-arbolb arbolb (rest camino))))))


;Ejercicio 7b

(define (inserta-ordenado n a)
  (cond
    ((vacio-arbolb? a) (construye-arbolb n arbolb-vacio arbolb-vacio))
    ((hoja-arbolb? a) (if (< n (dato-arbolb a))
                          (construye-arbolb (dato-arbolb a)
                                            (construye-arbolb n arbolb-vacio arbolb-vacio)
                                            arbolb-vacio)
                          (construye-arbolb (dato-arbolb a)
                                            arbolb-vacio
                                            (construye-arbolb n arbolb-vacio arbolb-vacio))))
    ((< n (dato-arbolb a)) (construye-arbolb (dato-arbolb a)
                                              (inserta-ordenado n (hijo-izq-arbolb a))
                                              (hijo-der-arbolb a)))
    (else (construye-arbolb (dato-arbolb a)
                             (hijo-izq-arbolb a)
                             (inserta-ordenado n (hijo-der-arbolb a))))))