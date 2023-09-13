#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")


;------------------------Otra función------------------------
;Nombre funcion: reps-option?
;Dominio: lista (para este caso la lista que se recibira sera la de opciones, esto para descartar opciones repetidas
;Recorrido: Booleano
;Recursión: De cola
;Descripción: Esta funcion sirve para verificar si existen elementos repetidos en una lista, para este caso, sirve para verificar si
;             las opciones a agregar tienen el mismo id o no, es decir, retorna #t en el caso de que existan elementos iguales,
;             retorna #f en el caso de que no existan elementos iguales en la lista.

(define (reps-option? lista)
  (define (aux element lista)
    (cond
      ((null? lista) #f) 
      ((equal? element (car lista)) #t) 
      (else (aux element (cdr lista))))) 
  (cond
    ((null? lista) #f) ;
    ((aux (car lista) (cdr lista)) #t) 
    (else (reps-option? (cdr lista))))) 


;------------------------Constructor------------------------
;Nombre función: flow
;Dominio: name(String) X Option(0 o más opciones)
;Recorrido: flow
;Recursión: No aplica?? (uso de la funcion reps-option? que usa recursion de cola)
;Descripción: Esta función toma argumentos asociados a un flujo, y retorna el flujo.
(define (flow id name . Option)
  (if (and (integer? id) (string? name) (list? Option) (not (reps-option? (map car Option))))  ;Si estan bien los datos ingresados, entonces se crea la lista
      (list id name Option)
      (display "Error, los datos son erroneos asegurate de que tus tipos de datos sean correctos o verifica si las opciones no son repetidas")))

;------------------------Selectores------------------------
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


;------------------------Modificadores------------------------
;Nombre: flow-add-option
;Dominio: flow X Option
;Recorrido: flow (modificado)
;Recursión: No aplica
;Descripción: Esta función toma como argumentos un flujo y una opción.
;siendo esta ultima agregada al flujo, retornando un flujo con la nueva opción
(define flow-add-option
  (lambda (flujo op)
    (if (not (member (get-code-option op) (map get-code-option (get-Option-flow flujo))))
        (append (list (get-id-flow flujo))
                (list (get-name-flow flujo))
                (list (append (get-Option-flow flujo) (list op))))
        (display "Error, la opción ya esta en el flujo"))))
        






