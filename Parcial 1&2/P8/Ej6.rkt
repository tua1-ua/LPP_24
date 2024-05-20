#lang racket
(require rackunit)
(require "lpp.rkt")


(define arbolb1 '(20 (13 (2 () ())
                         (18 () ()))
                     (40 (25 () () )
                         (43 () ()))))
(define arbolb2 '(20 (13 (2 () ())
                         (22 () ()))
                     (40 (25 () () )
                         (43 () ()))))


;Ejercicio 6a

(define (ordenado-entre? arbolb min max)
  (cond
    ((vacio-arbolb? arbolb) #t)
    (else (and (>= (dato-arbolb arbolb) min)
               (>= max (dato-arbolb arbolb))
               (ordenado-entre? (hijo-izq-arbolb arbolb) min (dato-arbolb arbolb))
               (ordenado-entre? (hijo-der-arbolb arbolb) (dato-arbolb arbolb) max)))))


;Ejercicio 6b


(define (ordenado-menor? arbolb max)
  (cond
    ((vacio-arbolb? arbolb) #t)
    (else (and (<= (dato-arbolb arbolb) max)
               (ordenado-menor? (hijo-izq-arbolb arbolb) (dato-arbolb arbolb))
               (ordenado-entre? (hijo-der-arbolb arbolb) (dato-arbolb arbolb) max)))))

(define (ordenado-mayor? arbolb min)
  (cond
    ((vacio-arbolb? arbolb) #t)
    (else (and (>= (dato-arbolb arbolb) min)
               (ordenado-entre? (hijo-izq-arbolb arbolb) min (dato-arbolb arbolb))
               (ordenado-mayor? (hijo-der-arbolb arbolb) (dato-arbolb arbolb))))))


;Ejercicio 6c

(define (ordenado? arbolb)
  (cond
    ((vacio-arbolb? arbolb) #t)
    (else (and (ordenado-menor? (hijo-izq-arbolb arbolb) (dato-arbolb arbolb))
               (ordenado-mayor? (hijo-der-arbolb arbolb) (dato-arbolb arbolb))))))
    