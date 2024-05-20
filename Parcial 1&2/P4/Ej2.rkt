#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 2a

(define (inserta-pos dato pos lista)
  (cond
    ((or (= pos 0) (null? lista)) (cons dato lista))
    (else (cons
           (first lista)
           (inserta-pos dato (- pos 1) (rest lista))))))


(check-equal? (inserta-pos 'b 2 '(a a a a)) '(a a b a a))
(check-equal? (inserta-pos 'b 0 '(a a a a)) '(b a a a a))



;Ejercicio 2b

(define (inserta-ordenada n lista-ordenada)
  (cond
    ((null? lista-ordenada) (cons n lista-ordenada))
    ((< n (first lista-ordenada)) (cons n lista-ordenada))
    (else (cons (first lista-ordenada)
                (inserta-ordenada n (rest lista-ordenada))))))

(check-equal? (inserta-ordenada 10 '(-8 2 3 11 20)) '(-8 2 3 10 11 20))



;Ejercicio 2c

(define (ordena lista)
  (cond
    ((null? lista) '())
    ((null? (rest lista)) lista)
    (else (inserta-ordenada (first lista)
                             (ordena (rest lista))))))

(check-equal? (ordena '(2 -1 100 4 -6)) '(-6 -1 2 4 100))

    
    