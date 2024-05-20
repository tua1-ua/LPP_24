#lang racket
(require rackunit)


;Ejercicio 6a

(define (coloca un dos tres tres-listas)
  (list (cons un (first tres-listas))
        (cons dos (second tres-listas))
        (cons tres (third tres-listas))))

(check-equal? (coloca 'a 'b 'c '(() () ())) '((a) (b) (c)))
(check-equal? (coloca 'b 'b 'b '((a) (a) (a))) '((b a) (b a) (b a)))
(check-equal? (coloca 'g 'h 'i '((a) (b c) (d e f))) '((g a) (h b c) (i d e f)))


;Ejercicio 6b

(define (reparte lista-cartas)
  (cond
    ((null? lista-cartas) (list (list) (list) (list)))
    (else (coloca (first lista-cartas)
                  (second lista-cartas)
                  (third lista-cartas) (reparte (rest (rest (rest lista-cartas))))))))


(define doce-cartas '(A♣ 2♣ 3♣ 4♣ 5♣ 6♣ 7♣ 8♣ 9♣ J♣ Q♣ K♣))
(check-equal? (reparte doce-cartas) '((A♣ 4♣ 7♣ J♣) (2♣ 5♣ 8♣ Q♣) (3♣ 6♣ 9♣ K♣)))



;Ejercicio 6c

(define (quita-ultimo lista)
  (cond
    ((null? (cdr lista)) '())
    (else (cons (first lista)
                (quita-ultimo (rest lista))))))

(define (elemento-central lista)
  (cond
    ((null? lista) '())
    ((null? (rest lista)) (first lista))
    (else (elemento-central (quita-ultimo (rest lista))))))

(check-equal? (elemento-central '(a b c d e f g)) 'd)


;Ejercicio 6d

(define (izquierda tres-listas)
  (append (third tres-listas)
          (first tres-listas)
          (second tres-listas)))

(define (centro tres-listas)
  (append (third tres-listas)
          (second tres-listas)
          (first tres-listas)))

(define (derecha tres-listas)
  (append (second tres-listas)
          (third tres-listas)
          (first tres-listas)))

(define (adivina lista)
  (elemento-central lista))



(define (suma-nums . args)
  (cond
    ((null? args) 0)
    (else (+ (first args)
             (apply suma-nums (rest args))))))


(define (suma-par p1 p2)
   (cons (+ (car p1) (car p2))
        (+ (cdr p1) (cdr p2))))


(define (suma-parejas . par)
  (cond
    ((null? par) (cons 0 0))
    (else (suma-par (first par)
                    (apply suma-parejas (rest par))))))




    
    
          