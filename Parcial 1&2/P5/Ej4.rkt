#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercici 4a

(define (contar-datos-iguales-fos lista-parejas)
  (cond
    ((null? lista-parejas) 0)
    (else (length (filter (lambda (x) (equal? (car x) (cdr x))) lista-parejas)))))

(check-equal? (contar-datos-iguales-fos 
               '((2 . 3) ("hola" . "hola") (#\a . #\a) (true . false))) 
              2)

(check-equal? (contar-datos-iguales-fos 
               '((2 . "hola") ("hola" . 3) (#\a . true) (#\b . false))) 
              0)



;Ejercicio 4b

(define (expande-pareja pareja)
  (cond
    ((null? pareja) '())
    ((= 0 (cdr pareja)) '())
    (else (cons (car pareja)
                (expande-pareja (cons (car pareja)
                                      (- (cdr pareja) 1)))))))


(define (expande-lista-fos lista-parejas)
  (cond
    ((null? lista-parejas) '())
    (else
     (foldr append '() (map expande-pareja lista-parejas)))))

(check-equal? (expande-lista-fos '((#t . 3) ("LPP" . 2) (b . 4))) '(#t #t #t "LPP" "LPP" b b b b))


;Ejercicio 4c

(define (comprueba-simbolos-fos lista-simbolos lista-num)
  (filter (lambda (x) (equal? (string-length (symbol->string (car x))) (cdr x))) 
   (map (lambda (x y) (cons x y)) lista-simbolos lista-num) ))

(check-equal? (comprueba-simbolos-fos '(este es un ejercicio de examen) '(2 1 2 9 1 6))
              '((un . 2) (ejercicio . 9) (examen . 6)))



  





