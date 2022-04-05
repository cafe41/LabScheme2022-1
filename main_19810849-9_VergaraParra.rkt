#lang racket
;Version hasta la fecha 01/04 del laboratorio en Scheme, con Racket

;-----------IMPORTACIÓN DE TDAs-----------;



;---------IMPORTACIÓN DE FUNCIONES---------;
;Importaré archivos de la misma carpeta en donde se encuentra main, ya que asumo que harán "pull" del repositorio con todos los archivos.
;
;importamos generarCartas, el cuál contiene las funciones que generan el mazo de cartas
(require "generarCartas_19810849-9_VergaraParra.rkt")
;importamos setCartas, archivo con funcionas que comprueban que el set esté bien hecho.
(require "TDA-cardsSet_19810849-9_VergaraParra.rkt")
;importamos modosDeJuego, el cuál contiene las funciones que definen y eligen el modo de juego
(require "modosDeJuego_19810849-9_VergaraParra.rkt")
;
(provide (all-defined-out))
;---