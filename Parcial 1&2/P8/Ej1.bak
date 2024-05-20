#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 1a

(define lista-a '((a b) d (c (e) (f g) h)))
(check-equal? (fourth (third lista-a)) 'h)

;Ejercicio 1b
(define lista-b1 '((2 (3)) (4 2) ((2) 3)))
(define lista-b2 '((b) (c (a)) d (a)))


;Ejercicio 1c

#|
Dada la definición de cuadrado-estruct vista en teoría:

(define (cuadrado-estruct lista)
  (cond ((null? lista) '())
        ((hoja? lista) (* lista lista ))
        (else (cons
             1➜(cuadrado-estruct (first lista)) ----> (cuadrado-estruct (2 (3))) ---> (4 (9))
             2➜(cuadrado-estruct (rest lista)))))) ---> (cuadrado-estruct ((4 2) ((2) 3))) ---->((16 4) ((4) 9)))

Indica qué devuelve la expresión (cuadrado-estruct lista-b1). La lista lista-b1 es la definida en el apartado anterior.
En la evaluación de la expresión anterior, indica cuáles son los argumentos que se pasan por parámetro en las llamadas recursivas a cuadrado-estruct marcadas con 1 y 2.
En la evaluación de la expresión anterior, indican qué devuelven las llamadas recursivas marcadas con 1 y 2.
La 2 y 3 las he respondido directamente.

La 1: Devuelve '((4 (9)) (16 4) ((4) 9))) 

|#


;Ejercicio 1d

(define (suma-1-si-mayor-igual-que-0 x)
  (if (>= x 0)
      (+ x 1)
      x))

(define (nivel-hoja-fos dato lista)
  (if (hoja? lista)
      (if (equal? lista dato) 0 -1)
      (suma-1-si-mayor-igual-que-0
       (foldr max -1 (map (lambda (elem)
                           (nivel-hoja-fos dato elem)) lista)))))


(map (lambda (elem)
         (nivel-hoja-fos 'a elem)) lista-b2)

;Con esta expresión se recorre la estructura de la lista y si el elem no es 'a devuelve -1.
;Si es 'a, pues devuelve su nivel.


