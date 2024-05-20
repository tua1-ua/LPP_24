#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 1a

(define (es-prefijo? pal1 pal2)
  (equal? pal1 (substring pal2 0 (string-length pal1))))

(define (contiene-prefijo prefijo lista-pal)
  (cond
    ((null? lista-pal) '())
    (else (cons
           (es-prefijo? prefijo (first lista-pal))
           (contiene-prefijo prefijo (rest lista-pal))))))


(check-equal? (es-prefijo? "ante" "anterior") #t)
(check-equal? (contiene-prefijo "ante" '("anterior" "antígona" "antena" "anatema")) '(#t #f #t #f))



;Ejercicio 1b

(define (cadenas-mayores lista1 lista2)
  (cond
    ((and (null? lista1) (null? lista2)) '())
    ((null? lista1) lista2)
    ((null? lista2) lista1)
    (else (if (>= (string-length (first lista1))
                  (string-length (first lista2)))
              (cons (first lista1) (cadenas-mayores (rest lista1) (rest lista2)))
              (cons (first lista2) (cadenas-mayores (rest lista1) (rest lista2)))))))

(check-equal? (cadenas-mayores '("hola" "que" "tal") '("adios")) '("adios" "que" "tal"))
(check-equal? (cadenas-mayores '("hola" "que" "tal") '("meme" "y" "adios")) '("hola" "que" "adios"))
(check-equal? (cadenas-mayores '("la" "primera" "práctica" "de" "recursión") '("confiar" "en" "la" "recursión" "facilita" "su" "resolución")) '("confiar" "primera" "práctica" "recursión" "recursión" "su" "resolución"))

