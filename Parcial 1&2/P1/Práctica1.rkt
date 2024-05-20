#lang racket

#|
Ejercicios 1 2 y 3 son demasiado fáciles
|#


;Ejercicio 4

;a
(define lista1 '(1 2 3 4 5))
(first (rest (rest lista1)))

;b
(rest(rest(rest (rest lista1))))

;c
(first (rest(rest(rest (rest lista1)))))
(last lista1)

;d devuelve la lista (4 5)
;e ¿(rest (rest '(1 (2 3) 4 5))) que devuelve? también la lista '(4 5)

;Ejercicio 5 se hace en hoja y es muy sencillo

;Ejercicio 6

(define (distancia p1 p2)
  (cond
    ((and (pair? p1) (pair? p2)) (sqrt (+ (expt (- (car p2) (car p1)) 2) (expt (- (cdr p2) (cdr p1)) 2) )))
    (else "Datos de entrada incorrectos" )))

(define p1 (cons 2 2))
(define p2 (cons 4 0))
(define p3 (cons 0 0))


(define (isosceles? p1 p2 p3)
  (cond
    ((and (pair? p1) (pair? p2) (pair? p3))
     (if (= (distancia p1 p2) (distancia p1 p3) (distancia p3 p2))
         #f
         (if (not (and (equal? (distancia p1 p2) (distancia p1 p3))
                  (equal? (distancia p2 p3) (distancia p1 p2))))
             #t #f)))
    (else "Datos de entrada incorrectos" )))