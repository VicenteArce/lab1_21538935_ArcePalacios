#lang racket
(provide (all-defined-out))
;------------------------Constructor-----------------------
;Nombre Función: make-user
;Dominio: numero(int)
;Recorrido: "user" X numero(int) -> "usernumero"
;Recursión: No aplica
;Descripción: Función que retorna un usuario agregandole un numero, por ejemplo, sea numero= 20, entonces se retorna "user20".
(define make-user (lambda (numero) (string-append "user" (number->string numero))))


