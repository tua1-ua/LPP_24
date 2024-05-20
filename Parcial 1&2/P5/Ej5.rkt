#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 5a

(define (suma-n-izq n lista-parejas)
  (map (lambda (res) (cons (+ n (car res))
                                (cdr res)) ) lista-parejas))


(check-equal? (suma-n-izq 10 '((1 . 3) (0 . 9) (5 . 8) (4 . 1)))
              '((11 . 3) (10 . 9) (15 . 8) (14 . 1)))


;Ejercicio 5b

(define (busca-mayor mayor? lista)
  (foldl (lambda (x y) (if (mayor? x y) x y)) (first lista) (rest lista)))


(check-equal? (busca-mayor > '(3 1 4 1 5)) 5)
(check-equal? (busca-mayor < '(5 2 8 1 9)) 1)
(check-equal? (busca-mayor (lambda (x y ) (> (string-length x) (string-length y)))
                           '("hola" "como" "estas" "domingo")) "domingo")
(check-equal? (busca-mayor <= '(100 50 25 75)) 25)


;Ejercicio 5c

(define (todos-menores? lista n)
  (for-all? (lambda (x) (< x n))
  (map (lambda (x) (busca-mayor > x)) lista)))

(check-equal? (todos-menores? '((10 30 20) (1 50 30) (30 40 90)) 100) #t)
(check-equal? (todos-menores? '((10 30 20) (1 50 30) (30 40 90)) 90) #f)
(check-equal? (todos-menores? '((10 30 20) (1 50 30) (30 40 90)) 55) #f)


(define (todos-menores-v2? lista n)
  (for-all? (lambda (list) (not (exists? (lambda (x) (>= x n)) list))) lista))

(check-equal? (todos-menores-v2? '((10 30 20) (1 50 30) (30 40 90)) 100) #t)
(check-equal? (todos-menores-v2? '((10 30 20) (1 50 30) (30 40 90)) 90) #f)
(check-equal? (todos-menores-v2? '((10 30 20) (1 50 30) (30 40 90)) 55) #f)
