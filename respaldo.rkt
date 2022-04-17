#lang racket
#;
(define (cardsSet Elements numE maxC rndFn)
        (if(procedure? cardsSet)(
                            ;true
                            ;llamaré a varios elementos dentro de Elements (a través de un número random)
                            ;luego aplicaré list cuando numE = 0
                            ;y cuando maxC = 0 haré un list a esas list, así tengo una matriz
                            ;planB: hacer una lista de cons

                            ;if
                            (if (not(equal? numE 0));if numE != 0
                                ;true
                                ;cons de un elemento de la lista Elements entre 0 y 80
                                (cons (list-ref Elements (modulo(rndFn(+(length cardsSet)(numE)))80))
                                ;la función disminuye numE cada vez que agrega un elemento
                                (cardsSet Elements (- numE 1) maxC (rndFn(+(length cardsSet)(numE)))))
                                ;false
                                (if (not(equal? maxC 0));if maxC != 0
                                    ;true
                                    (;si numE llega a 0, se le resta 1 a numC y numE pasa a ser length(cartaHecha)
                                    null
                                    (cardsSet Elements (length (car (cardsSet)) (- maxC 1) (rndFn(+(length cardsSet)(numE)))))
                                    ;false
                                    (list cardsSet);enlista todas las listas hasta ahora
                                    )
                                )
                            )
                           ;false
                           (display "cardsSet no es una lista o matriz")  
      )
)
)

;prime? del shyneem
(define (primeNumber? number)
  (encapsulado number 0 1))
(define (encapsulado number divs n)
  (if (eq? number n)
      #true
    (if  (> divs 2) 
        #false
        (if (eq? (modulo number n)0)
            (encapsulado number (+ 1 divs) (+ n 1))
            (encapsulado number divs (+ n 1))))))


