#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 4

(define (pascal-memo fil col dic)
  (cond ((= col 0) 1)
        ((= col fil) 1)
        ((not (equal? (get (cons fil col) dic) #f)) (get (cons fil col) dic))
        (else (put (cons fil col) (+ (pascal-memo (- fil 1) (- col 1) dic)
                                     (pascal-memo (- fil 1) col dic)) dic))))
    