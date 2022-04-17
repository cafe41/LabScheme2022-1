#lang racket
;El objetivo de este TDA es crear el juego y junto a sus funciones, verificar que funcione

;Algunas funciones requieren el TDA-cardsSet como prerequisito, por lo que lo importaré
(require "TDA-cardsSet_19810849-9_VergaraParra.rkt")
;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(provide (all-defined-out))

#|REPRESENTACIÓN:


numPlayers(int) X cardsSet (list) X Players (list)
numPlayers: Entero que señala la cantidad de jugadores.
cardsSet: Conjunto válido de cartas
players: lista con los nombres de los jugadores.|#


;CONSTRUCTOR:
;DOM: int X list X function X function
;REC: game (list)
;Recursión: No hay
;Resumen: Debe construir la función "game", la cual corresponde a la estructura que alberga el área de juego, las piezas disponibles, jugadores registrados, sus cartas y el estado del juego, entre otros elementos
(define (game numPlayers cardsSet stackMode randomFn)
        (list numPlayers cardsSet '()))

;PERTENENCIA:
;DOM: elementos
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.
(define (game? elementos)
  (if (and
      (integer?   (car elementos))
      (list?      (cadr elementos))
      (list?      (caddr elementos))
      )
      #true
      #false
  )
)
;SELECTORES: permiten obtener un dato específico del dato compuesto
(define (getNumPlayers game)
  (if (game? game)
      ;true
      (car game)
      ;false
      -1
      )
)

(define (getCardsSet game)
  (if (game? game)
      ;true
      (cadr game)
      ;false
      '()
      )
)

(define (getPlayers game)
  (if (game? game)
      ;true
      (caddr game)
      ;false
      '()
      )
)


;MODIFICADORES: alteran los datos de un elemento específico


;OTRAS FUNCIONES:

;stackMode
;DOM: cardsSet
;REC: cardsSet
;Recursión: No hay
;Resumen: Función que permite "retirar y voltear" las dos cartas superiores del stack de cartas en el juego y las dispone en el área de juego.
(define (stackMode cardsSet)
  (if (list? cardsSet);Si nos entregan otra cosa distinta a una lista, dará el error
        ;true
        (cdr(cdr cardsSet))
        ;false
        (error "cardsSet no es una lista de cartas")))

;register
;DOM: str X game (lista con el estado del juego actual)
;REC: game (list de lists)
;Recursión: No hay
;Resumen: Registra un jugador en game
(define (register user game)
  (if (not(<= (length game) 2));si el largo de game es menor o igual a 2:
      ;true
      (if (not(>=(length(list-ref game 2))(list-ref game 0)));si la cantidad de jugadores registrados es menor que la de jugadores
          ;true
          (list (getNumPlayers game)(getCardsSet game)(append (list-ref game 2) (list user)))
          ;false
          (error "Se ha registrado el máximo de jugadores")
      )
      ;false
      (append game (list(list user)))
      )
)

;whoseTurnIsIt?
;DOM: game (list de list)
;REC: str
;Recursión: No hay
#;(define (whoseTurnIsIt? game)(

                              )
)