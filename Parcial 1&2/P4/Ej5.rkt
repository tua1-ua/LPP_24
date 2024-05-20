#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 5a

#|
((lambda (x) (* x x)) 3) ; ⇒ Se eleva al cuadrado, osea devuelve 9
((lambda () (+ 6 4))) ; ⇒ ? La expresión no recibe entrada, devuelve 10 siempre
((lambda (x y) (* x (+ 2 y))) (+ 2 3) 4) ; ⇒ x=5 y=5, 5*6=30
((lambda (x y) (* x (+ 2 x))) 5) ; ⇒ ? Error, pq no se ha indicado el valor de y


(define f (lambda (a b) (string-append "***" a b "***")))
(define g f)
(procedure? g) ; ⇒ Devuelve el procediciento de la clausura de f
(g "Hola" "Adios") ; ⇒ Devuelve ***HolaAdios***

|#


;Ejercicio 5b

(define suma-3 (lambda (x)
                 (+ x 3)))

(check-equal? (suma-3 3) 6)

(define factorial (lambda (x)
                    (if (= 0 x)
                        1
                        (* x (factorial (- x 1))))))

(check-equal? (factorial 0) 1)
(check-equal? (factorial 4) 24)
(check-equal? (factorial 7) 5040)


;Ejercicio 5c

#|
(define (doble x)
   (* 2 x))

(define (foo f g x y)
   (f (g x) y))

(define (bar f p x y)
   (if (and (p x) (p y))
       (f x y)
       'error))

(foo + 10 doble 15) ; ⇒ ? (+ (10 doble) 15) --- Devuelve error, pq 10 no es un proc
(foo doble + 10 15) ; ⇒ ? (doble (+ 10) 15) --- Error, pq + necesita 2 argumentos
(foo + doble 10 15) ; ⇒ ? (+ (doble 10) 15) Devuelve 35
(foo string-append (lambda (x) (string-append "***" x)) "Hola" "Adios") ;
⇒ ? (string-append ((string-append "***" x) "Hola") "Adios")
Devuelve ____> "***HolaAdios"


(bar doble number? 10 15) ; ⇒ (and (number? 10) (number? 15) es verdadero,
entonces----> (doble 10 15) ----> devuelve error pq espera solo 1 argumento


(bar string-append string? "Hola" "Adios") ; ⇒ ? Primero comprueba que "Hola"
y "Adios" sean strings, lo son, entonces----> (string-append "Hola" "Adios")
Devuelve "HolaAdios" este método


(bar + number? "Hola" 5) ; ⇒ ? Devuelve error pq "Hola" no es un número


|#
