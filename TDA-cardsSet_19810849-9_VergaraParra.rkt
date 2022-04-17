#lang racket
;Este es el código del TDA "cardsSet", el cuál se refiere al set de cartas del juego dobble. El código además, contiene funciones que ayudarán a manejar el TDA y sus derivados.              

;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(require math/number-theory)
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
#;(define (cardsSet Elements numE maxC rndFn)
        (if(prime? (- numE 1))(
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
                           (error "El orden no es primo, por favor ingrese un numero de elementos válido")
      )
))

;PERTENENCIA: verifica los datos
;DOM: Lo que sea
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con el del TDA.

;SELECTORES: permiten obtener un dato específico del dato compuesto

;MODIFICADORES: alteran los datos de un elemento específico

;OTRAS FUNCIONES:

;calcularOrden
;DOM: int
;REC: Orden (int)
;Recursión: No hay
;Resumen: Calcula el orden (n) 
(define (calcularOrden numE)
    (if (integer? numE);Ya que el numero de elementos es n+1, siendo n el orden
        ;true
        (- numE 1)
        ;false
        (error "numE no es un int"))
)

(define L1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13))



(define (PrimeraCarta L1 numE n)
    (if (= n numE)
        null
        (cons (car L1) (PrimeraCarta (cdr L1) numE (+ n 1)))
      )
 )

(define Carta1 (PrimeraCarta L1 4 0))


(define (nCartas Carta1 listaCartasN i L1)
   (if (eq? (length Carta1) (+(length listaCartasN)1))
       listaCartasN
       (nCartas Carta1 (cons (crearCarta (cdr Carta1) i L1 (list (car Carta1)))
                             listaCartasN)
                (+ (- i 1) (length Carta1)) L1)))


(define (crearCarta Carta1 i L1 cartaN)
   (if (null? Carta1)
       cartaN
       (crearCarta (cdr Carta1) (+ i 1) L1
                   (cons (list-ref L1 i)cartaN))))



(define Cartas (cons Carta1 (nCartas Carta1 '() 4 L1)))

;DOM: list X int X function
;REC: PrimeraCarta (list)
;Recursión: Natural
;Resumen: Esta función crea la primera carta del set, en base a la cuál se harán las demás (a menos que solo sea necesaria una)
(define (crearPrimeraCarta Elements numE rndFn)
;es un ciclo de conds, donde si numE llega a 0, retorna un null, devolviendo una lista
  (if (not(equal? numE 0))
      ;true
      (cons (list-ref Elements numE)
      (crearPrimeraCarta Elements (- numE 1) rndFn))
      ;false
      null
  )
)

;DOM: list X list X int X int X procedure
;REC: cartaN (list)
;Recursión: Natural
;Resumen: Esta función crea n número de cartas, compartiendo el primer elemento de la primera carta creada
(define (crearCartaN Elements pCarta numE i rndFn);i irá sumandose a las variables para dar el resto de números '(1 5 6 7)'(1 8 9 10), etc...
;//then we build the next n number of cards
;for (j=1; j<=n; j++) {
 ;card = []
 ;card.push(1)
    ;for (k=1; k<=n; k++) {
    ;   card.push(n * j + (k+1))
    ;}
    ;cards.push(card)
;}
  ;j = maxC-1
  
(if (not(equal? numE 0));if numE != 0
    ;true
    (cons (list-ref Elements (+ numE i))
          (crearCartaN Elements pCarta (- numE 1) i rndFn))
    ;false
    ;Agrega el primer elemento de la primera carta
    (cons (car pCarta) null)
        )
)