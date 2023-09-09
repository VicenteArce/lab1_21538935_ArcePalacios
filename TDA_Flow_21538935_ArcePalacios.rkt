#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")


;------------------Constructor------------------
;Nombre función: flow
;Dominio: name(String) X Option(0 o más opciones)
;Recorrido: flow
;Recursión: No aplica
;Descripción: Esta función toma argumentos asociados a un flujo, y retorna el flujo.
(define (flow name . Option)
      (list 1 name Option)) ;El 1 es el ID, de momento esta como PLACEHOLDER

;-------------------Selectores-------------------
;Nombre función: get-id-flow
;Dominio: flow
;Recorrido: id(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un flujo y retorna el id del flujo

(define get-id-flow (lambda (flujo) (car flujo)))

;Nombre función: get-name-flow
;Dominio: flow
;Recorrido: name(String)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un flujo y retorna el nombre del flujo

(define get-name-flow (lambda (flujo) (cadr flujo)))

;Nombre función: get-Option-flow
;Dominio: flow
;Recorrido: Option(Lista de 0 o más opciones)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un flujo y retorna una lista de opciones que contiene el flujo

(define get-Option-flow (lambda (flujo) (caddr flujo)))


;--------------------Modificadores-----------------
;Nombre: flow-add-option
;Dominio: flow X Option
;Recorrido: flow (modificado)
;Recursión: No aplica
;Descripción: Esta función toma como argumentos un flujo y una opción.
;siendo esta ultima agregada al flujo, retornando un flujo con la nueva opción
(define flow-add-option
  (lambda (flujo op)
    (append (list (get-id-flow flujo))
            (list (get-name-flow flujo))
            (list (reverse (cons op (reverse (get-Option-flow flujo))))))))


;(define op1 (option 1 "1) Viajar" 2 4 "viajar" "turistear" "conocer"))
;(define op2 (option 2 "2) Estudiar" 4 3 "aprender" "perfeccionarme"))
;(define f10 (flow  "Flujo1"))

