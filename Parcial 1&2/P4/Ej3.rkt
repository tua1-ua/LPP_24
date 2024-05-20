#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 3a

(define (insert-second elem list)
  (cons (first list)(cons elem (cdr list))))

(define (mueve-al-principio lista dato)
  (cond
    ((null? lista) (cons dato lista))
    ((equal? dato (first lista)) lista)
    (else (insert-second (first lista)
                (mueve-al-principio (rest lista) dato)))))

(check-equal? (mueve-al-principio '(a b e c d e f) 'e) '(e a b c d e f))
(check-equal? (mueve-al-principio '(a b c d e f g) 'a) '(a b c d e f g))



;Ejercicio 3b

(define (comprueba-simbolos lista-simbolos lista-num)
  (cond
    ((or (null? lista-simbolos) (null? lista-num)) '())
   
    (else (if (equal?
               (string-length (symbol->string (first lista-simbolos)))
               (first lista-num))
              (cons (cons (first lista-simbolos)
                          (first lista-num)) (comprueba-simbolos (rest lista-simbolos) (rest lista-num)))
              (comprueba-simbolos (rest lista-simbolos) (rest lista-num))))))

(check-equal? (comprueba-simbolos '(este es un ejercicio de examen) '(2 1 2 9 1 6)) '((un . 2) (ejercicio . 9) (examen . 6)))



