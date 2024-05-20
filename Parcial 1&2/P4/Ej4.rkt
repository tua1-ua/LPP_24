#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 4a

(define (expande-pareja pareja)
  (cond
    ((null? pareja) '())
    ((= 0 (cdr pareja)) '())
    (else (cons (car pareja)
                (expande-pareja (cons (car pareja)
                                      (- (cdr pareja) 1)))))))


(check-equal? (expande-pareja '(hola . 3)) '(hola hola hola))
(check-equal? (expande-pareja '(#t . 5)) '(#t #t #t #t #t))



;Ejercicio 4b.1

(define (expande-lista lista-parejas)
  (cond
    ((null? lista-parejas) '())
    (else (append (expande-pareja (first lista-parejas))
                (expande-lista (rest lista-parejas))))))


(define (expande-parejas . parejas)
  (expande-lista parejas))

(check-equal? (expande-parejas '(#t . 3) '("LPP" . 2) '(b . 4)) '(#t #t #t "LPP" "LPP" b b b b))



;Ejercicio 4b.2

(define (expande-parejas-2 . parejas)
  (cond
    ((null? parejas) '())
    (else (append (expande-pareja (first parejas))
                  (apply expande-parejas-2 (rest parejas))))))


(check-equal? (expande-parejas-2 '(#t . 3) '("LPP" . 2) '(b . 4)) '(#t #t #t "LPP" "LPP" b b b b))



;Ejercicio 4c

(define (expande lista)
  (cond
    ((null? lista) '())
    ((number? (first lista)) (append (expande-pareja (cons (first (rest lista)) (first lista)))
                                     (expande (rest(rest lista)))))
    (else (cons (first lista)
                (expande (rest lista))))))

(check-equal? (expande '(4 clase ua 3 lpp aulario)) '(clase clase clase clase ua lpp lpp lpp aulario))



