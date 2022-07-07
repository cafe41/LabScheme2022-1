#lang racket
; PARADIGMAS DE LA PROGRAMACIÓN
; SECCIÓN DEL CURSO: 0-B-2
; PROFESOR DE TEORÍA: VICTOR FLORES
; PROFESOR DE LABORATORIO: VICTOR FLORES
;
; AUTOR
; NOMBRE: Gustavo Andrés Vergara Parra
; RUT: 19.810.849-9
; CARRERA: Ingeniería en Ejecución en Informática

;-----------IMPORTACIÓN DE TDAs-----------;
;importamos el TDA game, el cual se encarga de
(require "randomFn.rkt")
(require "TDA-cardsSet_19810849-9_VergaraParra.rkt")
(require "TDA-game_19810849-9_VergaraParra.rkt")
;al importar TDAgame, tambien importamos TDAcardsSet,
;archivo que genera el set de cartas y además contiene funcionas que comprueban que el set esté bien hecho.
(provide (all-defined-out))
;---;

(display(status(register "Juan" (register "Pedrito" (game 2 (cardsSet elements 2 3 rndFn) stackMode randomFn)))))