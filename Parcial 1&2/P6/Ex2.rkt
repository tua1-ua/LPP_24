#lang racket
(require rackunit)
(require "lpp.rkt")


;Ejercicio 2a

(define (expande-pareja par)
  (expande-pareja-iter par '()))

(define (expande-pareja-iter par res)
  (cond
    ((= (cdr par) 0) res)
    (else (expande-pareja-iter (cons (car par) (- (cdr par) 1))
                               (cons (car par) res)))))

(define (expande-parejas . lista)
  (expande-parejas-iter lista '()))


(define (expande-parejas-iter lista res)
  (cond
    ((null? lista) res)
    (else (expande-parejas-iter (rest lista)
                                (append res (expande-pareja (first lista)))))))

(check-equal? (expande-pareja (cons 'a 4)) '(a a a a))
(check-equal? (expande-parejas '(#t . 3) '("LPP" . 2) '(b . 4)) '(#t #t #t "LPP" "LPP" b b b b))


;Ejercicio 2b

(define (rotar k lista)
  (cond
    ((null? lista) '())
    ((= k 0) lista)
    (else (rotar (- k 1) (append (rest lista) (list (first lista)))))))

(check-equal? (rotar 4 '(a b c d e f g)) '(e f g a b c d))
