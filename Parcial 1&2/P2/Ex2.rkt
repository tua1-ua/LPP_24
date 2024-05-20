#lang racket
(require rackunit)
(require "lpp.rkt")


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


(check-equal? (encuentra-indice #\a) 0)
(check-equal? (encuentra-indice #\b) 1)
(check-equal? (encuentra-indice #\m) 12)
(check-equal? (encuentra-indice #\z) 25)

(check-equal? (encuentra-caracter 0) #\a)
(check-equal? (encuentra-caracter 1) #\b)
(check-equal? (encuentra-caracter 12) #\m)
(check-equal? (encuentra-caracter 25) #\z)

(check-equal? (entre-az? #\a) #t)
(check-equal? (entre-az? #\m) #t)
(check-equal? (entre-az? #\z) #t)
(check-equal? (entre-az? #\`) #f)
(check-equal? (entre-az? #\{) #f)

(check-equal? (rota-indice 4 12) 16)
(check-equal? (rota-indice 4 24) 2)
(check-equal? (rota-indice 4 -5) 25)



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

(check-equal? (cifra-caracter #\c 5) #\h)
(check-equal? (cifra-caracter #\z -1) #\y)
(check-equal? (cifra-caracter #\j 40) #\x)
(check-equal? (cifra-caracter #\D 3) #\G)
(check-equal? (cifra-caracter #\ñ 3) #\ñ)

(check-equal? (descifra-caracter #\d 3) #\a)
(check-equal? (descifra-caracter #\y -1) #\z)
(check-equal? (descifra-caracter #\x 40) #\j)
(check-equal? (descifra-caracter #\G 3) #\D)
(check-equal? (descifra-caracter #\tab 3) #\tab)

  
                                        
  
           