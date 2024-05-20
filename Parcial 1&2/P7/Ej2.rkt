#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 2a

;Recursiva
(define (concatena lista)
  (cond
    ((null? lista) "")
    ((hoja? lista) (symbol->string lista))
                                  
    (else (string-append (concatena (first lista))
                         (concatena (rest lista))))))

(check-equal? (concatena '(a b (c) d)) "abcd")
(check-equal? (concatena '(a (((b)) (c (d (e f (g))) h)) i)) "abcdefghi")


;Fos
(define (concatena-fos lista)
  (cond
    ((hoja? lista) (symbol->string lista))
    (else (foldr string-append "" (map (lambda (x) (concatena-fos x)) lista)))))

(check-equal? (concatena-fos '(a b (c) d)) "abcd")
(check-equal? (concatena-fos '(a (((b)) (c (d (e f (g))) h)) i)) "abcdefghi")



;Ejercicio 2b

(define (todos-positivos? lista)
  (cond
    ((null? lista) #t)
    ((hoja? lista)  (positive? lista))
    (else (and (todos-positivos? (first lista))
               (todos-positivos? (rest lista))))))

(check-equal? (todos-positivos? '(1 (2 (3 (-3))) 4)) #f)
(check-equal? (todos-positivos? '(1 (2 (3 (3))) 4)) #t)


;FOS
(define (todos-positivos-fos? lista)
  (cond
    ((null? lista) #t)
    ((hoja? lista)  (positive? lista))
    (else (exists? false? (map todos-positivos-fos? lista)))))

(check-equal? (todos-positivos-fos? '(1 (2 (3 (-3))) 4)) #f)
(check-equal? (todos-positivos-fos? '(1 (2 (3 (3))) 4)) #t)
  
    