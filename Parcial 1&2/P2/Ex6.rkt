#lang racket
(require rackunit)

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







    