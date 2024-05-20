#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 2a
(define (todos-iguales? lista)
  (cond
    ((null? lista) #t)
    ((null? (rest lista)) #t)
    (else (and
           (equal? (first lista) (first (rest lista)))
           (todos-iguales?  (rest lista))))))

(check-equal? (todos-iguales? '(a b b b)) #f)
(check-equal? (todos-iguales? '(a)) #t)
(check-equal? (todos-iguales? '(a a a a a a a)) #t)
(check-equal? (todos-iguales? '((a b) (a b) (a b))) #t)
(check-equal? (todos-iguales? '(a a a a a b)) #f)


;Ejercicio 2b
(define (contiene? lista elemento)
  (cond
    ((null? lista) #f)
    ((equal? elemento (first lista)) #t)
    (else (contiene? (rest lista) elemento))))

(define (todos-distintos? lista)
  (cond
    ((null? lista) #t)
    ((null? (rest lista)) #t)
    (else (and
           (not (contiene? (rest lista) (first lista)))
           (todos-distintos? (rest lista))))))

(check-equal? (todos-distintos? '(a b c)) #t "Prueba con elementos todos distintos")
(check-equal? (todos-distintos? '(a b c a)) #f "Prueba con un elemento repetido")


;Ejercicio 2c
(define (solo-dos-iguales? lista)
  (cond
    ((null? lista) #f)
    ((null? (rest lista)) #f)
    ((todos-distintos? (rest lista)) (contiene? (rest lista) (first lista)))
    (else
     (if (contiene? (rest lista) (first lista))
         #f
         (solo-dos-iguales? (rest lista))))))

(check-equal? (solo-dos-iguales? '()) #f)
(check-equal? (solo-dos-iguales? '(a)) #f)
(check-equal? (solo-dos-iguales? '(a b c a)) #t)
(check-equal? (solo-dos-iguales? '(a b c b a a)) #f)
(check-equal? (solo-dos-iguales? '(a b c a a)) #f)


