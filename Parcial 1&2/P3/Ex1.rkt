#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 1a
(define (minimo lista)
  (cond
    ((null? (rest lista)) (first lista))
    (else (if (<= (first lista) (minimo (rest lista)))
              (first lista)
              (minimo (rest lista))))))


(minimo '(2)) ; ⇒ 2
(minimo '(1 8 6 4 3)) ; ⇒ 1
(minimo '(1 -1 3 -6 4)) ; ⇒ -6


;A.2
#|
(minimo '(1 8 6 4 3)) ; ⇒ 1

-¿Qué lista se pasa como parámetro a la primera llamada recursiva a la función?
(mínimo (rest lista)) ----> (minimo '(8 6 4 3))


- Esa llamada recursiva devuelve el nº 3.

- Los argumentos son----> (< (first lista) (minimo (rest lista)))
                          = (< 1 3) ---> 1

|#


;Ejercicio 1C

;Funciones auxiliares

(define (encuentra-indice char)
  (cond
    ((equal? (char->integer char) 97) 0)
    (else (- (char->integer char) 97))))


(define (encuentra-caracter indice)
  (integer->char (+ indice 97)))


(define (entre-az? char)
  (and (>= (encuentra-indice char) 0)
       (<= (encuentra-indice char) 25 )))

(define (rota-indice indice desplazamiento)
  (modulo (+ indice desplazamiento) 26))



;Cifrar

(define (cifra-mayus char desplazamiento)
  (if (not (entre-az? char))
      (char-upcase (cifra-caracter (char-downcase char) desplazamiento) )
      char))

(define (cifra-caracter char desplazamiento)
  (cond
    ((char-upper-case? char) (cifra-mayus char desplazamiento ))
    (else
     (if  (entre-az? char)
          (encuentra-caracter (rota-indice desplazamiento (encuentra-indice char)))
          char))))



;Descifrar

(define (descifra-mayus char desplazamiento)
  (if (not (entre-az? char))
      (char-upcase (descifra-caracter (char-downcase char) desplazamiento) )
      char))



(define (descifra-caracter char desplazamiento)
  (cond
    ((char-upper-case? char) (descifra-mayus char desplazamiento) )
    (else
     (if (entre-az? char)
         (encuentra-caracter (rota-indice (* -1 desplazamiento) (encuentra-indice char)))
         char))))


(define (cifra-cadena cad desplazamiento)
  (cond
    ((null? (string->list cad)) "")
    (else (string-append (string (cifra-caracter (first (string->list cad)) desplazamiento))
                         (cifra-cadena (list->string (rest (string->list cad))) desplazamiento)))))


(define (descifra-cadena cad desplazamiento)
  (cond
    ((null? (string->list cad)) "")
    (else (string-append (string (descifra-caracter (first (string->list cad)) desplazamiento))
                         (descifra-cadena (list->string (rest (string->list cad))) desplazamiento)))))




;1D
(define (contiene? lista elemento)
  (cond
    ((null? lista) #f)
    ((equal? elemento (first lista)) #t)
    (else (contiene? (rest lista) elemento))))

(contiene? '(algo 3 #\A) 3) ; ⇒ #t
(contiene? '(algo 3 #\A) "algo") ; ⇒ #f
(contiene? '(algo 3 #\A) 'algo) ; ⇒ #t


(define (str-contiene? cadena char)
  (cond
    ((null? (string->list cadena)) #f)
    ((equal? char (first (string->list cadena))) #t)
    (else (str-contiene? (list->string (rest (string->list cadena))) char))))

(str-contiene? "Hola" #\o) ; ⇒ #t
(str-contiene? "Esto es una frase" #\space) ; ⇒ #t
(str-contiene? "Hola" #\h) ; ⇒ #f


    




