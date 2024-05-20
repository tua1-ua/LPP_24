#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 5

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


;Pruebas de carta

(define tres-de-picas '3♠)
(define as-de-corazones 'A♥)
(define jota-de-diamantes 'J♦)

(check-equal? (obten-palo #\♠) 'Picas)
(check-equal? (obten-palo #\♥) 'Corazones)
(check-equal? (obten-valor #\3) 3)
(check-equal? (obten-valor #\J) 10)

(check-equal? (carta 'A♥) '(1 . Corazones))
(check-equal? (carta '2♦) '(2 . Diamantes))
(check-equal? (carta 'K♣) '(12 . Tréboles))

(check-equal? (carta tres-de-picas) '(3 . Picas))
(check-equal? (carta as-de-corazones) '(1 . Corazones))
(check-equal? (carta jota-de-diamantes) '(10 . Diamantes))




(define (jugada-mano carta1 carta2 carta3)
  (cond
    ((= (car(carta carta1)) (car (carta carta2))  (car (carta carta3)))
     (string-append "trío de " (number->string (car (carta carta1)))))
    
    ((= (car(carta carta1)) (car (carta carta2)))
     (string-append "pareja de " (number->string (car (carta carta1)))))
    
    ((= (car(carta carta2)) (car (carta carta3)))
     (string-append "pareja de " (number->string (car (carta carta3)))))

    ((= (car(carta carta1)) (car (carta carta3)))
     (string-append "pareja de " (number->string (car (carta carta1)))))
     
    (else "nada")))
    

;Tests de la función jugada-mano
(check-equal? (jugada-mano '3♥ '3♣ '3♥) "trío de 3")
(check-equal? (jugada-mano 'K♦ '7♠ 'K♥) "pareja de 12")
(check-equal? (jugada-mano '5♣ '4♣ '6♣) "nada")
(check-equal? (jugada-mano 'Q♦ '3♥ 'Q♣) "pareja de 11")



;Ejercicio 5

(define (valor-carta cartas)
  (car (carta cartas)))

(define (palo-carta cartas)
  (cdr (carta cartas)))

(check-equal? (palo-carta 'A♠) 'Picas)
(check-equal? (palo-carta '2♣) 'Tréboles)
(check-equal? (palo-carta '3♥) 'Corazones)
(check-equal? (palo-carta '4♦) 'Diamantes)


;Ejercicio 5b

(define (veces-palo lista palo)
  (cond
    ((null? lista) 0)
    (else (if (equal? palo (palo-carta (first lista)))
              (+ 1 (veces-palo (rest lista) palo))
              (veces-palo (rest lista) palo)))))

(check-equal? (veces-palo '(5♠ 6♣ 7♥ 8♦ 9♠) 'Picas) 2)
(check-equal? (veces-palo '(J♠ Q♣ K♥) 'Diamantes) 0)
(check-equal? (veces-palo '(A♣ 2♥ 3♠) 'Corazones) 1)
(check-equal? (veces-palo '() 'Tréboles) 0)


(define (color? mano)
  (cond
    ((null? mano) #t)
    (else (equal? (length mano)
                  (veces-palo mano (palo-carta (first mano)))))))


(check-equal? (color? '(5♣ J♦ J♣ Q♠ Q♥)) #f)
(check-equal? (color? '(2♦ 5♦ 6♦ J♦ K♦)) #t)


;Ejercicio 5c

(define (escalera? list)
  (cond
    ((null? list) #t)
    ((null? (rest list)) #t)
    (else (and (< (valor-carta (first list))
                  (valor-carta (first (rest list))))
               (escalera? (rest (rest list)))))))

(check-equal? (escalera? '(5♣ 4♦ 3♣)) #f)
(check-equal? (escalera? '(8♣ 9♦ J♣ Q♦)) #t)
(check-equal? (escalera? '(8♣ 2♣)) #f)
(check-equal? (escalera? '(A♣ 2♦ 3♣)) #t)


(define (escalera-color? mano)
  (cond
    ((null? mano) #t)
    (else (and (escalera? mano)
               (color? mano)))))

(check-equal? (escalera-color? '(5♣ 6♦ 7♣ 8♠ 9♥)) #f)
(check-equal? (escalera-color? '(A♦ 2♦ 3♦ 4♦ 5♦)) #t)

    




           

