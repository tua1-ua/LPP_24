#lang racket
(require rackunit)

(define (cadenas-mayores lista1 lista2)
  (cond
    ((and (null? lista1) (null? lista2)) '())
    ((and (null? lista1) (not (null? lista2))) lista2)
    ((and (null? lista2) (not (null? lista1))) lista1)
    (else (if (>= (string-length (first lista1)) (string-length (first lista2)))
              (cons (first lista1) (cadenas-mayores (rest lista1) (rest lista2)))
              (cons (first lista2) (cadenas-mayores (rest lista1) (rest lista2)))))))


(cadenas-mayores '("hola" "que" "tal") '("meme" "y" "adios")) ; ⇒ ("hola" "que" "adios")
(cadenas-mayores '("esto" "es" "lpp") '("hoy" "hay" "clase")) ; ⇒ ("esto" "hay" "clase")
;Test de la función menor-de-tres
