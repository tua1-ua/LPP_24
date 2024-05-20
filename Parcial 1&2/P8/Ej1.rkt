#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 1a.1

(define arbol '(15 (4 (2) (3))
                   (8 (6))
                   (12 (9) (10) (11))))

(check-equal? (dato-arbol (second(hijos-arbol (third (hijos-arbol arbol))))) 10)


;Ejercicio 1a.2

(define (suma-datos-arbol arbol)
    (+ (dato-arbol arbol)
       (suma-datos-bosque (hijos-arbol arbol))))

(define (suma-datos-bosque bosque)
    (if (null? bosque)
        0
        (+ (suma-datos-arbol (first bosque)) 
           (suma-datos-bosque (rest bosque)))))


#|
Si realizamos la siguiente llamada a la función suma-datos-bosque, siendo arbol el definido en el apartado anterior:

(suma-datos-bosque (hijos-arbol arbol))

    ¿Qué devuelve la invocación a (suma-datos-arbol (first bosque)) que se realiza dentro de la función?
    Devuelve la suma del arbol formado por el primer hijo (4,2,3) = devuelve 9
    
    ¿Qué devuelve la primera llamada recursiva a suma-datos-bosque?
    Devuelve la suma de los hijos 2 (8) y 3 (12). Entonces:
    8+6+12+9+10+11=56 devuelve la primera llamada recursiva.
|#

;Ejercicio 1a.3

#|
a.3) La función de orden superior que hemos visto en teoría y que realiza también la suma de los datos de un árbol es:

(define (suma-datos-arbol-fos arbol)
   (foldr + (dato-arbol arbol) 
       (map suma-datos-arbol-fos (hijos-arbol arbol))))

Si realizamos la siguiente llamada a la función, siendo arbol el definido en el apartado anterior:

(suma-datos-arbol-fos arbol)

    ¿Qué devuelve la invocación a map dentro de la función?
    Devuelve la lista de hijos del arbol pero que se le han sumado sus hijos:
    (9 14 32)
    ¿Qué invocaciones se realizan a la función + durante la ejecución de foldr sobre la lista devuelta por la invocación a map? Enuméralas en orden, indicando sus parámetros y el valor devuelto en cada una de ellas.
    Primero: (9 14 32) son las invocaciones que se le suman a dato-arbol.
|#

;Ejercicio 1b.1

(define arbolb '(40 (23 (5 () ()) (32 (29) ())) (45 () (56))))
(check-equal? (dato-arbolb (hijo-izq-arbolb (hijo-der-arbolb
                                (hijo-izq-arbolb arbolb)))) 29)



