#lang racket
;Este es el código del TDA "cardsSet", el cuál se refiere al set de cartas del juego dobble. El código además, contiene funciones que ayudarán a manejar el TDA y sus derivados.              

;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(provide (all-defined-out))

#|REPRESENTACIÓN:
Elements (list) X numE(int) X maxC(int) X rndFn (fn)

Elements: Lista desde donde se puede obtener una muestra de elementos (números, letras, figuras, etc.) para construir el conjunto de cartas.
numE: Entero positivo que indica la cantidad de elementos esperada en cada carta
maxC: Entero que indica la cantidad máxima de cartas que se busca generar en el conjunto. Si maxC <=0 se producen todas las cartas posibles para un conjunto válido.
rndFn: Función de aleatorización que debe garantizar transparencia referencial.|#


;CONSTRUCTOR:
;DOM: list X int X int X function
;REC: cardsSet
;Recursión: No hay
;Resumen: Esta función crea el set de cartas del juego Dobble, el cuál se usará para otras funciones dentro de "main" y "game"
(define (cardsSet Elements numE maxC rndFn)(
                    (* rndFN numE maxC)



)


;PERTENENCIA: verifica los datos
;DOM: Lo que sea
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.

;SELECTORES: permiten obtener un dato específico del dato compuesto

;MODIFICADORES: alteran los datos de un elemento específico

;OTRAS FUNCIONES:

