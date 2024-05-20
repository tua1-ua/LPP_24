#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 3a
(define (mi-foldl func res list)
  (cond
    ((null? list) res)
    (else (mi-foldl func (func (first list) res) (rest list)))))

(check-equal? (mi-foldl string-append "****" '("hola" "que" "tal")) "talquehola****")
(check-equal? (mi-foldl cons '() '(1 2 3 4)) '(4 3 2 1))


;Ejercicio 3b

(define (binario-a-decimal lista-bits)
  (binario-a-decimal-iter lista-bits 0))

(define (binario-a-decimal-iter list res)
  (cond
    ((null? list) res)
    (else (binario-a-decimal-iter (rest list)
                                  (+(* res 2)(first list))))))