#lang racket
;El objetivo de este TDA es crear el juego y junto a sus funciones, verificar que funcione

;Algunas funciones requieren el TDA-cardsSet como prerequisito, por lo que lo importaré
(require "TDA-cardsSet_19810849-9_VergaraParra.rkt")
;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(provide (all-defined-out))

#|REPRESENTACIÓN:
numPlayers(int) X cardsSet X mode (fn) X rndFn (fn)

numPlayers: Entero que señala la cantidad de jugadores.
cardsSet: Conjunto válido de cartas
mode: Función que permite internamente determinar el modo de juego, la forma en que se ejecutan los turnos, repartición de cartas, etc.
rndFn: Función de aleatorización que debe garantizar transparencia referencial.|#


;CONSTRUCTOR:
;DOM: integer X list X function X function
;REC: game
;Recursión: No hay
;Resumen: Debe construir la función "game", la cual corresponde a la estructura que alberga el área de juego, las piezas disponibles, jugadores registrados, sus cartas y el estado del juego, entre otros elementos

#|(define (game numPlayers (cardsSet('() A B C)) mode rndFn)
)
|#

;PERTENENCIA:
;DOM: Lista con elementos
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.
(define (game? elementos)
  (if (and
      (list? elementos)
      (integer?   (car elementos))
      (list?      (car(cdr elementos)))
      (procedure? (car(cdr(cdr elementos))))
      (procedure? (car(cdr(cdr(cdr elementos)))))
      )
      #true
      #false
  )
)

;SELECTORES: permiten obtener un dato específico del dato compuesto

;MODIFICADORES: alteran los datos de un elemento específico

;OTRAS FUNCIONES: