#lang racket
;Esta parte del código contiene funciones que buscan resolver problemas relacionados 
;Resuelve las funcionalidades 2,3,4 y 5 del laboratorio
(define b(/ 5 5))


;REPRESENTACIÓN:
;(Mes) Int X (Dia) Int X (Año) Int

;CONSTRUCTOR:
#|DOM: Elements (list) X numE(int) X maxC(int) X rndFn (fn)
Elements: Lista desde donde se puede obtener una muestra de elementos (números, letras, figuras, etc.) para construir el conjunto de cartas.
numE: Entero positivo que indica la cantidad de elementos esperada en cada carta
maxC: Entero que indica la cantidad máxima de cartas que se busca generar en el conjunto. Si maxC <=0 se producen todas las cartas posibles para un conjunto válido.
rndFn: Función de aleatorización que debe garantizar transparencia referencial.
       Se proporciona función de ejemplo al final del enunciado. Es opcional implementar otra.
       La función se puede usar internamente para aleatorizar aspectos en la generación de cartas tales como orden de los elementos, tamaño de los elementos, etc.|#
;REC: cardsSet
#|(define (cardsSet Elements numE maxC rndFn)
)
|#

;PERTENENCIA: verifica los datos
;DOM: Lo que sea
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.

;SELECTORES: permiten obtener un dato específico del dato compuesto

;MODIFICADORES: alteran los datos de un elemento específico

;OTRAS FUNCIONES:

