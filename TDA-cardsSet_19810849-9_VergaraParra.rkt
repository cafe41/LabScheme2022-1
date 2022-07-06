#lang racket
;Este es el código del TDA "cardsSet", el cuál se refiere al set de cartas del juego dobble. El código además, contiene funciones que ayudarán a manejar el TDA y sus derivados.              

;Importaré la función randomFn como rndFn
(require "randomFn.rkt")
(require math/number-theory)
(provide (all-defined-out))

;Bibloteca de elementos (con la que realizaré pruebas)
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
  (if (<= maxC (length(append (list(crearPrimeraCarta Elements 1 (calcularOrden numE)))
                            (cicloCartasN Elements (list-ref Elements 1) (calcularOrden numE) 1 1)
                            (cicloCartasN2 Elements (calcularOrden numE) 1 1 1))))
                    ;true
                    (if (equal? maxC 1)
                        ;true
                        (cons (cadrRecursivo maxC  (append (list(crearPrimeraCarta Elements 1 (calcularOrden numE)))
                            (cicloCartasN Elements (list-ref Elements 1) (calcularOrden numE) 1 1)
                            (cicloCartasN2 Elements (calcularOrden numE) 1 1 1))) null)
                        ;false
                        (cons (cadrRecursivo maxC (append (list(crearPrimeraCarta Elements 1 (calcularOrden numE)))
                                                          ;//then we build the next n number of cards
                                                          ;for (j=1; j<=n; j++) {
                                                          ;card = []
                                                          ;crearCartaN
                                                          ;cards.push(card)
                                                          ;}
                                                          (cicloCartasN Elements (list-ref Elements 1) (calcularOrden numE) 1 1)
                                                          ;//finally we build the next n2 number of cards
                                                          ;for (i= 1; i<=n; i++) {
                                                          ;for (j=1; j<=n; j++) {
                                                          ;card = []
                                                          ;crearCartaN2
                                                          ;cards.push(card)
                                                          ;}
                                                          ;}                
                                                          (cicloCartasN2 Elements (calcularOrden numE) 1 1 1)))
                              (cardsSet Elements numE (- maxC 1) rndFn))
                        )
                    ;false
                    (display "Pidió más cartas de las que puede generar con esa cantidad de elementos.\n")
                    )
)
;Ejemplos de uso:
      ;(cardsSet '("0" "1" "2" "3") 2 3 rndFn)
      ;(cardsSet elements 3 7 rndFn)
      ;(cardsSet elements 3 10 rndFn)

;PERTENENCIA: verifica los datos
;DOM: Lo que sea
;REC: Boolean
;Recursión: Ninguna
;Resumen: Verifica que los elementos de lo que sea que hayan pasado como Dominio cumplan con los del TDA.
(define (cardsSet? elementos)
  (if (and
      (list?   (car elementos))
      (string? (car (car elementos)))
      )
      #true
      #false
  )
)
;Ejemplos de uso:
      ;(cardsSet? (cardsSet elements 2 3 rndFn))
      ;(cardsSet? (cardsSet elements 3 7 rndFn))
      ;(cardsSet? '(0 () 1 2))

;SELECTORES: permiten obtener un dato específico del dato compuesto

;getCard
;DOM: int X cardsSet
;REC: Card (list)
;Recursión: Natural
;Resumen: Consigue una carta "n" del cardSet, si es posible.
(define (getCard n cardsSet)
  (if (not(> n (length cardsSet)))
      ;true
      (if (equal? n 0)
          ;true (caso base)
          (car cardsSet)
          ;false
          (getCard (- n 1) (cdr cardsSet))
          )
      ;false
      (display "El número (n) que ingresó es mayor que la cantidad de cartas")
      )
)
;Ejemplos de uso:
      ;(getCard 0 (cardsSet elements 2 3 rndFn))
      ;(getCard 1 (cardsSet elements 2 3 rndFn))
      ;(getCard 10 (cardsSet elements 2 3 rndFn))

;MODIFICADORES: alteran los datos de un elemento específico

;setCard
;DOM: cardsSet X int X Card(list) X list
;REC: cardsSet
;Recursión: De cola
;Resumen: Cambia la carta "n" por otra que se le entregue.
(define (setCard cardsSet n card nCartas)
  (if (not(> n (length cardsSet)))
      ;true
      (if (equal? n 0)
          ;true (caso base)
          (append nCartas (list card) (cdr cardsSet))
          ;false (llamado recursivo)
          (setCard (cdr cardsSet) (- n 1) card (append nCartas (list (car cardsSet))))
          )
  ;false
  (display "El número (n) que ingresó es mayor que la cantidad de cartas")
  )
)
;Ejemplos de uso:
      ;(setCard (cardsSet elements 2 3 rndFn) 10 '("X" "D") '())
      ;(setCard (cardsSet elements 2 3 rndFn) 1 '("X" "D") '())
      ;(setCard (cardsSet elements 2 3 rndFn) 0 '("Hello" "World") '())

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

;crearPrimeraCarta
;DOM: list X int
;REC: PrimeraCarta (list)
;Recursión: Natural
;Resumen: Esta función crea la primera carta del set, en base a la cuál se harán las demás (a menos que solo sea necesaria una)
(define (crearPrimeraCarta Elements iterador n)
;es un ciclo de conds, donde si se cumple el falso, retorna un null, devolviendo una lista
  (if (<= iterador (+ n 1));numE = n + 1
      ;true
      (cons (list-ref Elements iterador)
      (crearPrimeraCarta Elements (+ iterador 1) n))
      ;false
      null
  )
);Ejemplos de uso:
      ;(crearPrimeraCarta elements 1 (calcularOrden 5))

;cicloCartasN
;DOM: list X str X int X int X int
;REC: list(list)
;Recursión: Natural
;Resumen: función que llama a "crearCrataN" de forma recursiva, para crear todas las cartasN (cantidad cartas = n)
(define (cicloCartasN Elements elementoPC n j k)
  ;Cuclo de j hasta n
  (if (< j n)
      ;true 
      (cons  (crearCartaN Elements elementoPC n j k) (cicloCartasN Elements elementoPC n (+ j 1) k))
      ;false (caso base)
      (cons  (crearCartaN Elements elementoPC n j k) null) ;card.push(1)
      )
);Ejemplos de uso:
      ;(cicloCartasN elements (list-ref elements 1) 4 1 1)

;crearCartaN
;DOM: list X int X int X int X int
;REC: cartaN (list)
;Recursión: Natural
;Resumen: Esta función crea cartas "n", compartiendo el primer elemento de la primera carta creada
(define (crearCartaN Elements elementoPC n j k);i irá sumandose a las variables para dar el resto de números '(1 5 6 7)'(1 8 9 10), etc...
(if (<= k n);if numE != 0
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
;Ejemplos de uso:
      ;(crearCartaN elements (list-ref elements 1) 4 1 1)

;cicloCartasN2
;DOM: list X int X int X int X int
;REC: list(list)
;Recursión: Natural
;Resumen: Esta función llama a la función crea "cartasN^2" de forma recursiva, para crear una lista con estas cartas
(define (cicloCartasN2 Elements n i j k)
  ;Ciclo de i hasta n
  (if (<= i n)
      ;true
      ;Ciclo de j hasta n
      (if (< j n)
          ;true 
          (cons  (crearCartaN2 Elements n i j k) (cicloCartasN2 Elements n i (+ j 1) k))
          ;false (caso base)
          (cons  (crearCartaN2 Elements n i j k) (cicloCartasN2 Elements n (+ i 1) 1 1))
          )
      ;false
      null
      )
)
;Ejemplos de uso:
      ;(cicloCartasN2 elements 4 1 1 1)

;crearCartaN2
;DOM: list X int X int X int X int
;REC: cartaN2 (list)
;Recursión: Natural
;Resumen: Esta función crea cartas "n^2", a través de un par de ciclos recursivos
(define (crearCartaN2 Elements n i j k)
  (if (<= k n);if numE != 0
      ;true
      ;for (k=1; k<= n; k++) {
      ;card.push(n+2+n*(k-1)+(((i-1)*(k-1)+j-1) % n))
      ;}
      (cons (list-ref Elements (+ (modulo (+(* (- i 1)(- k 1))(- j 1)) n)(+(+ n 2)(* n(- k 1)))))
            (crearCartaN2 Elements n i j (+ k 1)))
      ;false
      ;Agrega el primer elemento de la carta
      ;card.push(i+1)
      (cons (list-ref Elements (+ i 1)) null)
   )
)
;Ejemplos de uso:
      ;(crearCartaN2 elements 4 1 1 1)

;cadrRecursivo
;DOM: int X list
;REC: elemento de una lista
;Recursión: Natural
;Resumen: Función que aplica un cdr de forma recursiva y luego un car
(define (cadrRecursivo num list)
      (if (equal? num 1)
          ;true
          (car list)
          ;false
          (cadrRecursivo (- num 1) (cdr list))
      )
)
;Ejemplos de uso:
      ;(cadrRecursivo 3 '(1 2 3 4 5 6))

;dobble?
;DOM: cardsSet
;REC: boolean
;Recursión: Natural
;Resumen: Función que verifica que un mazo "cardsSet" sea válido


;Ejemplos de uso:
      ;
      ;
      ;

;dobble?
;DOM: cardsSet
;REC: boolean
;Recursión: Natural
;Resumen: Función que verifica que un mazo "cardsSet" sea válido


;Ejemplos de uso:
      ;
      ;
      ;