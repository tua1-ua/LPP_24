#lang racket
(require rackunit)
(require "lpp.rkt")

;Ejercicio 5a

(define (es-camino? lista arbol)
    (and (equal? (dato-arbol arbol) (first lista))
         (es-camino-bosque? (rest lista) (hijos-arbol arbol))))


(define (es-camino-bosque? lista bosque)
  (cond
    ((and (null? lista) (null? bosque)) #t)
    ((or (null? lista) (null? bosque)) #f)
    (else (or (es-camino? lista (first bosque))
               (es-camino-bosque? lista (rest bosque))))))


(define arbol '(a (a
                   (a)
                   (b))
                  (b
                   (a)
                   (c))
                  (c)))


(define (es-camino-fos? lista arbol)
  (and
   (equal? (dato-arbol arbol) (first lista))
   (or (and (null? (rest lista)) (hoja-arbol? arbol))
       (exists? (lambda (x)(equal? x #t)) (map (lambda (elem) (es-camino-fos? (rest lista) elem)) (hijos-arbol arbol))))))




;Ejercicio 5b


(define (nodos-nivel nivel arbol)
  (cond
    ((= nivel 0) (list (dato-arbol arbol)))
    (else (nodos-nivel-bosque (- nivel 1) (hijos-arbol arbol)))))


(define (nodos-nivel-bosque nivel bosque)
  (cond
    ((null? bosque) '())
    (else (append (nodos-nivel nivel (first bosque))
                  (nodos-nivel-bosque nivel (rest bosque))))))


(define arbol5.2 '(1 (2 (3 (4)
                           (2))
                        (5))
                     (6 (7))))

(check-equal? (nodos-nivel 0 arbol5.2) '(1))
(check-equal? (nodos-nivel 1 arbol5.2) '(2 6))
(check-equal? (nodos-nivel 2 arbol5.2) '(3 5 7))
(check-equal? (nodos-nivel 3 arbol5.2) '(4 2))
(check-equal? (nodos-nivel 4 arbol5.2) '())


(define (nodos-nivel-fos nivel arbol)
  (cond
    ((= nivel 0) (list (dato-arbol arbol)))
    (else (foldr append '() (map (lambda (x) (nodos-nivel-fos (- nivel 1) x)) (hijos-arbol arbol))))))

 (check-equal? (nodos-nivel-fos 0 arbol5.2) '(1))
(check-equal? (nodos-nivel-fos 1 arbol5.2) '(2 6))
(check-equal? (nodos-nivel-fos 2 arbol5.2) '(3 5 7))
(check-equal? (nodos-nivel-fos 3 arbol5.2) '(4 2))
(check-equal? (nodos-nivel-fos 4 arbol5.2) '())