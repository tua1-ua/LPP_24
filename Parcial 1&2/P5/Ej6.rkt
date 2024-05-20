#lang racket
(require rackunit)
(require "lpp.rkt")
(require "dependency.rkt")

;Dependencias

(define (coloca-v0 un dos tres tres-listas)
  (list (cons un (first tres-listas))
        (cons dos (second tres-listas))
        (cons tres (third tres-listas))))

(define (reparte-tres lista-cartas)
  (cond
    ((null? lista-cartas) (list (list) (list) (list)))
    (else (coloca-v0 (first lista-cartas)
                  (second lista-cartas)
                  (third lista-cartas) (reparte-tres (rest (rest (rest lista-cartas))))))))



;Ejercicio 6a

(define (coloca nlist . elems)
  (if (null? elems)
      nlist
      (map (lambda(x y) (cons y x))  nlist elems)))

(check-equal? (coloca '(() () ()) 'a 'b 'c) '((a) (b) (c)))
(check-equal? (coloca '((a) (a)) 'b 'b) '((b a) (b a)))
(check-equal? (coloca '((a b c d)) 'e) '((e a b c d)))
(check-equal? (coloca '()) '())
(check-equal? (coloca '((a) (b c) (d e f) (g h i j)) 'k 'l 'm 'n) '((k a) (l b c) (m d e f) (n g h i j)))



(define (reparte-cuatro lista-cartas)
  (cond
    ((null? lista-cartas) (list (list) (list) (list) (list)))
    (else (coloca (reparte-cuatro (rest (rest (rest (rest lista-cartas)))))
                  (first lista-cartas)
                  (second lista-cartas)
                  (third lista-cartas)
                  (fourth lista-cartas)))))

(check-equal? (reparte-cuatro '(A♣ 2♣ 3♣ 4♣ 5♣ 6♣ 7♣ 8♣ 9♣ J♣ Q♣ K♣)) '((A♣ 5♣ 9♣) (2♣ 6♣ J♣) (3♣ 7♣ Q♣) (4♣ 8♣ K♣)))


;Ejercicio 6b

(define (escoge-en-orden lista . ordinales)
  (cond
    ((or (null? lista)
        (null? ordinales)) '())
    (else  (append (list ((first ordinales) lista))
                 (apply escoge-en-orden lista (rest ordinales))))))

(check-equal? (escoge-en-orden '(1 2 3 4 5)) '())
(check-equal? (escoge-en-orden '(1 2 3 4 5) fourth second) '(4 2))
(check-equal? (escoge-en-orden '(a b c d) third second fourth first) '(c b d a))
(check-equal? (escoge-en-orden '(dos tres un) third first second) '(un dos tres))



(define (reordena-tres-montones baraja f-ordinal1 f-ordinal2 f-ordinal3)
  (cond
    ((null? baraja) '())
    (else (escoge-en-orden (reparte-tres baraja) f-ordinal1 f-ordinal2 f-ordinal3))))


(define (reordena-cuatro-montones baraja f-ordinal1 f-ordinal2 f-ordinal3 f-ordinal4)
  (cond
    ((null? baraja) '())
    (else (escoge-en-orden (reparte-cuatro baraja) f-ordinal1 f-ordinal2 f-ordinal3 f-ordinal4))))


(check-equal? (reordena-tres-montones '(A♣ 2♣ 3♣ 4♣ 5♣ 6♣ 7♣ 8♣ 9♣ J♣ Q♣ K♣) second first third)
              '((2♣ 5♣ 8♣ Q♣) (A♣ 4♣ 7♣ J♣) (3♣ 6♣ 9♣ K♣)))

(check-equal? (reordena-cuatro-montones '(A♣ 2♣ 3♣ 4♣ 5♣ 6♣ 7♣ 8♣ 9♣ J♣ Q♣ K♣) fourth second first third)
              '((4♣ 8♣ K♣) (2♣ 6♣ J♣) (A♣ 5♣ 9♣) (3♣ 7♣ Q♣)))



;Ejercicio 6c

(define (junta-montones montones)
  (cond
    ((null? montones) '())
    (else (foldr append '() montones))))


(check-equal? (junta-montones '((4♣ 8♣ K♣) (2♣ 6♣ J♣) (A♣ 5♣ 9♣) (3♣ 7♣ Q♣)))
              '(4♣ 8♣ K♣ 2♣ 6♣ J♣ A♣ 5♣ 9♣ 3♣ 7♣ Q♣))


;Ejercicio 6d


(define (adivina baraja par1 par2 par3)
  (list-ref baraja
            (+ (* (- (car par3) 1) (cdr par2) (cdr par1))
               (* (- (car par2) 1) (cdr par1))
               (- (car par1) 1))))