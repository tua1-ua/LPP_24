#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 1a

(define (concat lista)
  (concat-iter lista ""))

(define (concat-iter lista res)
  (cond
    ((null? lista) res)
    (else (concat-iter (rest lista)
                       (string-append res (first lista))))))

(check-equal? (concat '("hola" "y" "adiós")) "holayadiós")
(check-equal? (concat-iter '("hola" "y" "adiós") "") "holayadiós")


;Ejercicio 1b

(define (min-max lista)
  (min-max-iter lista (cons 0 0)))

(define (min-max-iter lista res)
  (cond
    ((null? lista) res)
    (else
     (min-max-iter (rest lista)
                   (if (< (first lista) (car res))
                       (cons (first lista) (cdr res))
                       (if (> (first lista) (cdr res))
                           (cons (car res) (first lista))
                           res))))))

(check-equal? (min-max '(2 5 9 12 5 0 4)) '(0 . 12))
(check-equal? (min-max '(3 2 -8 4 10 0)) '(-8 . 10))
(check-equal? (min-max-iter '(5 9 12 -2 5 0 4) (cons 2 2)) '(-2 . 12))



   