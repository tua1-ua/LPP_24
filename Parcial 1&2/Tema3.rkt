#lang racket
(require rackunit)
(require "lpp.rkt")
(require 2htdp/image)


;Mi-length iterativo
(define (mi-length list)
  (mi-length-iter list 0))

(define (mi-length-iter list result)
  (cond
    ((null? list) result)
    (else (mi-length-iter (rest list) (+ 1 result)))))



;Suma-lista
(define (suma-lista list)
  (suma-list-iter list 0))

(define (suma-list-iter list res)
  (cond
    ((null? list) res)
    (else (suma-list-iter (rest list) (+ res (first list))))))


;Fibonacci
(define (fib n)
   (fib-iter 1 0 n))

(define (fib-iter a b count)
   (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

;triangulo pascal
(define (pascal fila col)
   (list-ref (pascal-fila '(1) fila) col))

(define (pascal-fila lista-fila n)
   (if (= 0 n)
      lista-fila
      (pascal-fila (pascal-sig-fila lista-fila) (- n 1))))

(define (pascal-sig-fila lista-fila)
   (append '(1)
           (pascal-suma-dos-a-dos lista-fila)
           '(1)))

(define (pascal-suma-dos-a-dos lista-fila)
   (if (null? (rest lista-fila))
      '()
      (cons (+ (first lista-fila) (second lista-fila))
            (pascal-suma-dos-a-dos (rest lista-fila)))))


;Fibonacci con memoización
(define (fib-memo n dic)
  (cond
    ((not (equal? #f (get n dic))) (get n dic))
    ((= 0 n) (put 0 0 dic))
    ((= 1 n) (put 1 1 dic))
    (else (put n
               (+ (fib-memo (- n 1) dic)
                  (fib-memo (- n 2) dic))
               dic))))

;Figuras recursivas
(circle 30 "solid" "blue")
(square 30 "outline" "black")
(rectangle 80 40 "solid" "gray")
(triangle 40 "solid" "red")

(define triangulo (isosceles-triangle 60 30 "outline" "black"))
(rotate 90 triangulo) 
; ⇒ imagen rotada 90 grados en sentido contrario a las agujas del reloj
(rotate -90 triangulo)
; ⇒ imagen rotada 90 grados en sentido de las agujas del reloj
