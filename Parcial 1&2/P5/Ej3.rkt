#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 3a

#|

(map (lambda (x)
         (cond 
            ((symbol? x) (symbol->string x))
            ((number? x) (number->string x))
            ((boolean? x) (if x "#t" "#f"))
            (else "desconocido"))) '(1 #t hola #f (1 . 2))) ; ⇒ ? ("1" "#t" "hola" "#f" "desconocido")

(filter (lambda (x) 
            (equal? (string-ref (symbol->string x) 1) #\a)) 
    '(alicante barcelona madrid almería)) ; ⇒ ? Se filtra aquellos elementos cuyo segundo carácter es #\a
                                                (barcelona madrid)

(foldr (lambda (dato resultado)
          (string-append dato "*" resultado)) "" 
          '("Hola" "que" "tal")) ; ⇒ "hola*que*tal*"

(foldr append '() '((1 2) (3 4 5) (6 7) (8))) ; ⇒ ? (1 2 3 4 5 6 7 8)

(foldl (lambda (dato resultado)
         (string-append
          (symbol->string (car dato))
          (symbol->string (cdr dato))
          resultado)) "" '((a . b) (hola . adios) (una . pareja))) ; ⇒ "unaparejaholaadiosab"

(foldr (lambda (dato resultado)
           (cons (+ (car resultado) dato)
                 (+ (cdr resultado) 1))) '(0 . 0) '(1 1 2 2 3 3)) ; ⇒ (12 . 6) se van sumando los numeros en la izquierda, y en la derecha el nº de iteraciones

(apply + (map cdr '((1 . 3) (2 . 8) (2 . 4)))) ; ⇒ ? Se suma la parte derecha de una lista de parejas
                                                    15

(apply min (map car (filter (lambda (p)
                                  (> (car p) (cdr p))) 
                                  '((3 . 1) (1 . 20) (5 . 2))))) ; ⇒ ? primero se filtra aquellas parejas cuya parte izq es mayor ---> '((3 . 1) (5 . 2))
                                                                       Después el map transforma la lista y se coge solo la part izq de las parejas y el resultado es el min---> 3


|#



;Ejercicio 3b

; Los siguientes ejercicios utilizan esta definición de lista

(define lista '((2 . 7) (3 . 5) (10 . 4) (5 . 5)))


; Queremos obtener una lista donde cada número es la suma de las
; parejas que son pares

(filter even?
        (map (lambda (x) (+ (car x)
                                 (cdr x)))
               lista))
; ⇒ (8 14 10)


; Queremos obtener una lista de parejas invertidas donde la "nueva"
; parte izquierda es mayor que la derecha.

(filter (lambda (x) (> (car x) (cdr x)))
        (map (lambda (x) (cons (cdr x) (car x))) lista))
; ⇒ ((7 . 2) (5 . 3))


; Queremos obtener una lista cuyos elementos son las partes izquierda
; de aquellas parejas cuya suma sea par.

(foldr (lambda (x res) (cons (car x) res)) '()
        (filter (lambda (x) (even? (+ (car x) (cdr x)))) lista))
; ⇒ (3 10 5)


;Ejercicio 3c

(define (f1 x) (lambda (y z) (string-append y z x)))
(define g1 (f1 "a"))
(check-equal? (g1 "clase" "lpp") "claselppa")

(define (f2 x) (lambda (y z) (list y x z)))
(define g2 (f2 "lpp"))
(check-equal? (g2 "hola" "clase") (list "hola" "lpp" "clase"))

(define (f3 g3) (lambda(z x) (g3 z x)))
(check-equal? ((f3 cons) 3 4)  '(3 . 4))
