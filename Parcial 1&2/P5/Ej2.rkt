#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 2a

(define (inserta-ordenada-genérica n lista-ordenada menor-igual?)
  (cond
    ((null? lista-ordenada) (cons n lista-ordenada))
    ((menor-igual? n (first lista-ordenada)) (cons n lista-ordenada))
    (else (cons (first lista-ordenada)
                (inserta-ordenada-genérica n (rest lista-ordenada)
                                           menor-igual?)))))


(check-equal? (inserta-ordenada-genérica "banana" '("apple" "orange" "strawberry") string<=?) '("apple" "banana" "orange" "strawberry"))
(check-equal? (inserta-ordenada-genérica #\c '(#\a #\b #\d #\e) char<=?) '(#\a #\b #\c #\d #\e))
(check-equal? (inserta-ordenada-genérica 0 '(2 4 6 8 10) (lambda (x y) (even? x))) '(0 2 4 6 8 10))


(define (ordena-genérica lista menor-igual?)
  (cond
    ((null? lista) lista)
    ((null? (rest lista)) lista)
    (else (inserta-ordenada-genérica (first lista)
                                     (ordena-genérica (rest lista) menor-igual?)
                                     menor-igual?))))

(check-equal? (ordena-genérica '("banana" "apple" "orange" "strawberry") string<=?) '("apple" "banana" "orange" "strawberry"))
(check-equal? (ordena-genérica '(#\c #\a #\e #\b #\d) char<=?) '(#\a #\b #\c #\d #\e))
(check-equal? (ordena-genérica '(10 5 8 3 6) (lambda (x y) (<= x y))) '(3 5 6 8 10))



;Ejercicio 2b

(check-equal? (ordena-genérica '("Hola" "me" "llamo" "Iñigo" "Montoya")  (lambda (x y) (<=  (string-length x) (string-length y)))) '("me" "Hola" "llamo" "Iñigo" "Montoya"))
(check-equal? (ordena-genérica '("Hola" "me" "llamo" "Iñigo" "Montoya") (lambda (x y) (char<=?  (string-ref x 0) (string-ref y 0))) ) '("Hola" "Iñigo" "Montoya" "llamo" "me"))
(check-equal? (ordena-genérica '((2 . 2) (1 . 1) (3 . 0) (5 . 1)) (lambda (x y) (<= (+ (car x) (cdr x)) (+ (car y) (cdr y)))))  '((1 . 1) (3 . 0) (2 . 2) (5 . 1)))


;Ejercicio 2c

;Funciones Auxiliares

(define (obten-palo char)
  (cond
    ((equal? char #\♠) 'Picas)
    ((equal? char #\♥) 'Corazones)
    ((equal? char #\♣) 'Tréboles)
    ((equal? char #\♦) 'Diamantes)))

(define (obten-valor char)
  (cond
    ((equal? char #\A) 1)
    ((equal? char #\J) 10)
    ((equal? char #\Q) 11)
    ((equal? char #\K) 12)
    (else (- (char->integer char) 48))))

(define (carta cadena)
  (cons (obten-valor (string-ref (symbol->string cadena) 0))
        (obten-palo (string-ref (symbol->string cadena) 1))))

(define (valor-carta cartas)
  (car (carta cartas)))

(define (palo-carta cartas)
  (cdr (carta cartas)))


;Ejercicio 2c

(define (ordena-cartas lista-cartas)
  (ordena-genérica lista-cartas (lambda (x y) (<= (valor-carta x) (valor-carta y)))))

(check-equal? (ordena-cartas '(Q♠ J♣ 5♣ Q♥ J♦)) '(5♣ J♣ J♦ Q♠ Q♥))

    