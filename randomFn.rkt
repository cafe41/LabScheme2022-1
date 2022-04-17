#lang racket
;Esta función será importada a los TDAs y otras funciones.
(provide (all-defined-out))
;Me "robé" la función que dieron como ejemplo, ahí dice que podemos usarla.
(define m 2147483647)
(define a 1103515245)
(define c 123456)

(define randomFn (lambda (xn)
                   (modulo (+ (* a xn) c) m)
                 )
)
;Definiré rndFn como la función tambien, ya que así sale en los ejemplos de los TDA
(define rndFn (lambda (xn)
                   (modulo (+ (* a xn) c) m)
                 )
)