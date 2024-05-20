#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 1a

(define (aplica-veces f1 f2 n x)
  (cond
    ((= 0 n) x)
    (else (f1 (f2 (aplica-veces f1 f2 (- n 1) x))))))


(check-equal? (aplica-veces (lambda (x) (+ x 1)) (lambda (x) (+ x 2)) 2 10) 16)
(check-equal? (aplica-veces (lambda (x) (* x x)) (lambda (x) (+ x 1)) 4 3) 7072978201)



;Ejercicio 1b

(define (insert-second elem list)
  (cons (first list)(cons elem (cdr list))))


(define (mueve-al-principio-condicion pred lista)
  (cond
    ((null? lista) lista)
    ((null? (filter pred lista)) lista)
    ((pred (first lista)) lista)
    (else (insert-second (first lista)
                         (mueve-al-principio-condicion pred
                                                       (rest lista))))))

(check-equal? (mueve-al-principio-condicion number? '(a b c 1 d 1 e)) '(1 a b c d 1 e))
(check-equal? (mueve-al-principio-condicion number? '(1 a b 1 c)) '(1 a b 1 c))
(check-equal? (mueve-al-principio-condicion number? '(a b c d)) '(a b c d))


;Ejercicio 1c

(define (comprueba pred lista1 lista2)
  (cond
    ((or (null? lista1)
        (null? lista2)) '())
    ((pred (first lista1) (first lista2)) (cons (cons (first lista1) (first lista2))
                                                (comprueba pred (rest lista1) (rest lista2))))
    (else (comprueba pred (rest lista1) (rest lista2)))))


(check-equal? (comprueba (lambda (x y) (= (string-length (symbol->string x)) y))
                '(este es un ejercicio de examen)
                '(2 1 2 9 1 6))
              '((un . 2) (ejercicio . 9) (examen . 6)))

(check-equal? (comprueba (lambda (x y) (= (string-length x) (string-length y)))
                '("aui" "a" "ae" "c" "aeiou")
                '("hola" "b" "es" "que" "cinco"))
              '(("a" . "b") ("ae" . "es") ("aeiou" . "cinco")))

    


                          