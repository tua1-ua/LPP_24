#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 2a

(define (to-string-arbol arbol)
  (string-append (symbol->string (dato-arbolb arbol))
                 (to-string-bosque (hijos-arbol arbol))))

(define (to-string-bosque bosque)
  (cond
    ((null? bosque) "")
    (else (string-append (to-string-arbol (first bosque))
                         (to-string-bosque (rest bosque))))))

(define arbol2 '(a (b (c (d)) (e)) (f)))
(to-string-arbol arbol2) ; ⇒ "abcdef"


;FOS
(define (to-string-arbol-fos arbol)
  (string-append (symbol->string (dato-arbolb arbol))
        (foldr string-append "" (map to-string-arbol-fos (hijos-arbol arbol)))))


;Ejercicio 2b

(define (veces-arbol dato arbol)
  (cond
    ((equal? dato (dato-arbolb arbol)) (+ 1 (veces-bosque dato (hijos-arbol arbol))))
    (else (veces-bosque dato (hijos-arbol arbol)))))

(define (veces-bosque dato bosque)
  (cond
    ((null? bosque) 0)
    (else (+ (veces-arbol dato (first bosque))
             (veces-bosque dato (rest bosque))))))

(define (suma-1-si-igual dato num)
  (if (equal? dato num) 1 0))


(define (veces-arbol-fos dato arbol)
  (+ (suma-1-si-igual dato (dato-arbolb arbol))
     (foldr + 0 (map (lambda (x) (veces-arbol-fos dato x)) (hijos-arbol arbol)))))
