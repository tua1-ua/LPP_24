#lang racket
(require rackunit)
(require "lpp.rkt")
(require 2htdp/image)

(define (componer-alfombra figura circulo)
  (above (beside figura figura figura)
         (beside figura circulo figura)
         (beside figura figura figura)))

(define (alfombra-sierpinski tam)
  (if (<= tam 20)
      (circle (/ tam 2) "outline" "blue")
      (componer-alfombra (alfombra-sierpinski (/ tam 3))
                         (circle (/ tam 6) "solid" "blue"))))

(alfombra-sierpinski 600)