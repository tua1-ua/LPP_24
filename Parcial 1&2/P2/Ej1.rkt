#lang racket

(define (binario-a-decimal b3 b2 b1 b0)
  (cond
    ((and (number? b3) (number? b2) (number? b1) (number? b0))
     (+ (* b3 (expt 2 3)) (* b2 (expt 2 2)) (* b1 (expt 2 1)) (* b0 (expt 2 0)) ))
    (else "No se han introducido numero binario")))


(binario-a-decimal 1 1 1 1) ; ⇒ 15
(binario-a-decimal 0 1 1 0) ; ⇒ 6
(binario-a-decimal 0 0 1 0) ; ⇒ 2



(define (binario-a-hexadecimal b3 b2 b1 b0)
  (cond
    ((< (binario-a-decimal b3 b2 b1 b0) 10) (integer->char (+ 48
                                                              (binario-a-decimal b3 b2 b1 b0))))
    (else (integer->char (+ 55 (binario-a-decimal b3 b2 b1 b0))) )))

(binario-a-hexadecimal 1 1 1 1) ; ⇒ #\F
(binario-a-hexadecimal 0 1 1 0) ; ⇒ #\6
(binario-a-hexadecimal 1 0 1 0) ; ⇒ #\A