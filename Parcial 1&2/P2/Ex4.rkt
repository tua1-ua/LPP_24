#lang racket

; Ejercicio 3a
#|
(define (f x)
    (cons x 2))

(define (g x y)
    (cons x y))

(g (f (+ 2 1)) (+ 1 1))

// Modelo de sustitución normal

(g (f (+ 2 1)) (+ 1 1)) -----> (R4 sustituimos g por su cuerpo)
(cons (f (+ 2 1)) (+ 1 1)) ----->  (R4 sustituimos f por su cuerpo)
(cons (cons (+ 2 1) 2) (+ 1 1)) -----> (evaluamos las sumas r3)
(cons (cons 3 2) 2) -----> (R3 evaluamos (cons 3 2))
(cons (3 . 2) 2) ------> (r3 evaluamos el cons)
((3 . 2) . 2)


// Modelo de sustitución aplicativa

(g (f (+ 2 1)) (+ 1 1)) ---> (R3) sustituimos las sumas por su resultado
(g (f 3) 2) ----> (r4 sustituimos f por su cuerpo)
(g (cons 3 2) 2) ----> (r3 evaluamos el cons)
(g (3 . 2) 2) ------> (r4 sustituimos g por su cuerpo)
(cons (3.2) 2) -----> (r3 evaluamos el cons)
((3.2) . 2)

|#


; Ejercicio 3b

#|

(define (func-1 x)
    (/ x 0))

(define (func-2 x y)
    (if (= x 0)
        0
        y))

// Modelo de sustitución normal

(func-2 0 (func-1 10)) ----> (R4 sustituimos func-1 por su cuerpo)
(func-2 0 (/ 10 0) -----> (R4 sustituimos func-2 por su cuerpo)
(if (= 0 0)
    0
    (/ 10 0)) ------> (r3 evaluamos el if)
Devuelve true entonces---> 0


// Modelo de sustitución aplicativa

(func-2 0 (func-1 10)) --------> (Sustituimos func-1 por su cuerpo R4)
(func-2 0 (/ 10 0) ----------> (Evaluamos la división)
Error (no se puede dividir entre cero.



|#

