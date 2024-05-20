#lang racket
(require rackunit)
(require "lpp.rkt")

(define (contar-datos-iguales lista-parejas)
  (cond
    ((null? lista-parejas) 0)
    ((equal? (car (first lista-parejas))
             (cdr (first lista-parejas)))
     (+ 1 (contar-datos-iguales (rest lista-parejas))))
    (else (contar-datos-iguales (rest lista-parejas)))))


(check-equal? (contar-datos-iguales '((2 . 3) ("hola" . "hola") (\#a . \#a) (true . false))) 2)
(check-equal? (contar-datos-iguales '((2 . "hola") ("hola" . 3) (\#a . true) (\#b . false))) 0)
