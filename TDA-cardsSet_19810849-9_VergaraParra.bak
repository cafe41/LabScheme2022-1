#lang racket
;Este es el código del TDA "cardsSet", el cuál se refiere al set de cartas del juego dobble. El código además, contiene funciones que ayudarán a manejar el TDA y sus derivados.              

;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(require math/number-theory)
(provide (all-defined-out))

;Bibloteca de elementos
(define elements(list "!" "E1" "#" "E2" "$"  "E3" "%" "E4" "/" "E5" "E6" "E7" "E8" "E9" "E10" ")"
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
(define (cardsSet Elements numE maxC rndFn)
        (if(prime? (calcularOrden numE))
                            ;true
                            (if (equal? maxC 1)
                                ;true
                                (cons (crearPrimeraCarta Elements numE) null)
                                ;false
                                ;//then we build the next n number of cards
                                ;for (j=1; j<=n; j++) {
                                    ;card = []
                                    ;crearCartaN
                                    ;cards.push(card)
                                ;}

                                ;//finally we build the next n2 number of cards
                                ;for (i= 1; i<=n; i++) {
                                   ;for (j=1; j<=n; j++) {
                                      ;card = []
                                      ;crearCartaN2
                                      ;cards.push(card)
                                   ;}
                                ;}
                                (display "WIP")
                            )
                            ;false
                            (error "El orden no es primo, por favor ingrese un numero de elementos válido")               
           )
)

;PERTENENCIA: verifica los datos
;DOM: Lo que sea
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.

;SELECTORES: permiten obtener un dato específico del dato compuesto

;MODIFICADORES: alteran los datos de un elemento específico

;OTRAS FUNCIONES:

;calcularOrden
;DOM: int X int
;REC: Orden (int)
;Recursión: No hay
;Resumen: Calcula el orden (n) 
(define (calcularOrden numE)
    (if (integer? numE) ;Ya que el numero de elementos es n+1, siendo n el orden
        ;true
        (- numE 1)
        ;false
        (error "numE no es un int"))
)

;DOM: list X int
;REC: PrimeraCarta (list)
;Recursión: Natural
;Resumen: Esta función crea la primera carta del set, en base a la cuál se harán las demás (a menos que solo sea necesaria una)
(define (crearPrimeraCarta Elements numE)
;es un ciclo de conds, donde si numE llega a 0, retorna un null, devolviendo una lista
  (if (not(equal? numE 0))
      ;true
      (cons (list-ref Elements numE)
      (crearPrimeraCarta Elements (- numE 1)))
      ;false
      null
  )
)

;DOM: list X int X int X int X int
;REC: cartaN (list)
;Recursión: Natural
;Resumen: Esta función crea cartas "n", compartiendo el primer elemento de la primera carta creada
(define (crearCartaN Elements elementoPC n j k);i irá sumandose a las variables para dar el resto de números '(1 5 6 7)'(1 8 9 10), etc...
(if (not(equal? n k));if numE != 0
    ;true
    ;for (k=1; k<=n; k++) {
       ;card.push(n * j + (k+1))
    ;}
    (cons (list-ref Elements (+ (* n j)(+ k 1)))
          (crearCartaN Elements elementoPC n j (+ k 1)))
    ;false
    ;Agrega el primer elemento de la primera carta (elementoPC)
    ;card.push(1)
    (cons elementoPC null)
        )
)

;DOM: list X int X int X int X int X procedure
;REC: cartaN2 (list)
;Recursión: Natural
;Resumen: Esta función crea cartas "n^2", a través de un par de ciclos recursivos
(define (crearCartaN2 Elements n i j k rndFn)
(if (not(equal? n k));if numE != 0
    ;true
    ;for (k=1; k<= n; k++) {
       ;card.push(n+2+n*(k-1)+(((i-1)*(k-1)+j-1) % n))
    ;}
    (cons (list-ref Elements (+ (modulo (+(* (- i 1)(- k 1))(- j 1)) n)(*(+ n 2 n)(- k 1))))
          (crearCartaN Elements n i j (+ k 1) rndFn))
    ;false
    ;Agrega el primer elemento de la carta
    ;card.push(i+1)
    (cons (+ i 1) null)
    )
)