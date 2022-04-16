#lang racket
;Este es el código del TDA "cardsSet", el cuál se refiere al set de cartas del juego dobble. El código además, contiene funciones que ayudarán a manejar el TDA y sus derivados.              

;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(provide (all-defined-out))

;Bibloteca de elementos
(define Elements(list "!" "E1" "#" "E2" "$"  "E3" "%" "E4" "/" "E5" "E6" "E7" "E8" "E9" "E10" ")"
                      "E11" "(" "E12" "E13" "E14" "E15" "E16" "E17" "E18" "E19" "E20" "E21" "E22"
                      "E23" "E24" "E25" "E26" "E28" "E29" "E30" "/&" "#$" "!¡!¡" "?¿" "¿?" "¿" "¡"
                      "=" ")(" "≖‿≖" "ツ" "(◉‿◉)" "(❂‿❂)" "°Д°" "◕‿◕" "♪" "(°͜ʖ°)" "ಠ۾ಠ" "♬"
                      "(っ•́-•́)っ" "ʕ-ᴥ-ʔ" "・ω・" "(╯°o°)╯" "ಠ∩ಠ" "Ღ" "♦" "♠" "☻" "☺" "♥" "♣" "●"
                      "♂" "♀" "►" "◄" "▲" "▼" "¬u¬" "..." "μ" "holi" "como" "estas"));80 elementos

#|REPRESENTACIÓN:
Elements (list) X numE(int) X maxC(int) X rndFn (fn)

Elements: Lista desde donde se puede obtener una muestra de elementos (números, letras, figuras, etc.) para construir el conjunto de cartas.
numE: Entero positivo que indica la cantidad de elementos esperada en cada carta
maxC: Entero que indica la cantidad máxima de cartas que se busca generar en el conjunto. Si maxC <=0 se producen todas las cartas posibles para un conjunto válido.
rndFn: Función de aleatorización que debe garantizar transparencia referencial.|#

;CONSTRUCTOR:
;DOM: list X int X int X function
;REC: cardsSet
;Recursión: Natural
;Resumen: Esta función crea el set de cartas del juego Dobble, el cuál se usará para otras funciones dentro de "main" y "game"
(define (cardsSet Elements numE maxC (rndFn(+(length cardsSet)(numE))))(
        (if(list? cardsSet) (;true
                            ;llamaré a varios elementos dentro de Elements (a través de un número random)
                            ;luego aplicaré list cuando numE = 0
                            ;y cuando maxC = 0 haré un list a esas list, así tengo una matriz
                            ;planB: hacer una lista de cons
                    
                            ;if
                            (if (not(equal? numE 0));if numE != 0
                                ;true
                                (;cons de un elemento de la lista Elements entre 0 y 80
                                 (cons (list-ref Elements  (modulo(rndFn(+(length cardsSet)(numE)))80)))
                                 ;la función disminuye numE cada vez que agrega un elemento
                                 (cardsSet Elements (- numE 1) maxC (rndFn(+(length cardsSet)(numE)))))
                                ;false
                                (if (not(equal? maxC 0));if maxC != 0
                                    ;true
                                    (;si numE llega a 0, se le resta 1 a numC y numE pasa a ser length(cartaHecha)
                                     (cons null)
                                     (cardsSet Elements (length (list-ref cardsSet 0)) (- maxC 1) (rndFn(+(length cardsSet)(numE)))))
                                    ;false
                                    (list cardsSet);enlista todas las listas hasta ahora
                                    )
                             )
                            )
                           (;false
                           (display "cardsSet no es una lista o matriz"))
      ))
)

;PERTENENCIA: verifica los datos
;DOM: Lo que sea
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.

;SELECTORES: permiten obtener un dato específico del dato compuesto

;MODIFICADORES: alteran los datos de un elemento específico

;OTRAS FUNCIONES:

