#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 6a

(define (suma-izq pareja n)
  (cons (+ n (car pareja)) (cdr pareja)))

(define (suma-der pareja n)
  (cons (car pareja) (+ n (cdr pareja))))

(check-equal? (suma-izq (cons 10 20) 3) (cons 13 20))
(check-equal? (suma-der (cons 10 20) 5) (cons 10 25))


;Ejercicio 6b

(define (suma-impares-pares lista-num)
  (cond
    ((null? lista-num) (cons 0 0))
    ((even? (first lista-num)) (suma-der
                                (suma-impares-pares (rest lista-num))
                                (first lista-num)))
    (else (suma-izq
           (suma-impares-pares (rest lista-num))
           (first lista-num)))))

(check-equal? (suma-impares-pares '(3 2 1 4 8 7 6 5)) (cons 16 20))
(check-equal? (suma-impares-pares '(3 1 5)) (cons 9 0))



;Ejercicio 6c

(define (cadena-mayor lista)
  (cond
    ((null? lista) (cons "" 0))
    ((> (string-length (first lista))
        (string-length (car (cadena-mayor (rest lista))))) (cons (first lista) (string-length (first lista))))
    (else (cadena-mayor (rest lista)))))
    
(check-equal? (cadena-mayor '("vamos" "a" "obtener" "la" "cadena" "mayor")) (cons "obtener" 7))
(check-equal? (cadena-mayor '("prueba" "con" "maximo" "igual")) (cons "maximo"  6))
(check-equal? (cadena-mayor '()) (cons "" 0)) ; ⇒ ("" . 0))

    

     
