#lang racket
(define randomFn (lambda (xn)
                   (lambda(a)
                    (lambda(c)
                     (lambda(m)
                   (modulo (+ ( a xn) c) m))))
                 )
)