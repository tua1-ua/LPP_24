#lang racket
(require rackunit)
(require "lpp.rkt")
(require 2htdp/image)


(define (combina-koch figura)
  (beside/align "bottom"
                figura
                (rotate 60 figura)
                (rotate -60 figura)
                figura))

(define (koch nivel trazo)
  (if (= 0 nivel)
      (line trazo 0 "black")
      (combina-koch (koch (- nivel 1) (/ trazo 3)))))


;Ejercicio 5b

(define (componer-copo-nieve figura)
  (above figura
         (beside (rotate 120 figura)
                 (rotate -120 figura))))

(define (copo-nieve nivel trazo)
  (componer-copo-nieve (koch nivel trazo)))

(copo-nieve 5 200)