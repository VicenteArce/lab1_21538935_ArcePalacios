#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")


;------------------------Otras funciones--------------------
;Nombre función: equal-first-code?
;Dominio: l1 (lista) X l2 (lista)
;Recorrido: bool
;Recursión: no aplica
;Descripción: Función que compara los primeros dos elementos de una lista, función declarada para ser usada en el constructor del flow.
;         Sirve en conjunto a la funcion remove-duplicates para la verificación de un code único de una opción en un flujo.
(define (equal-first-code? l1 l2)
  (equal? (get-code-option l1) (get-code-option l2)))

;------------------------Constructor------------------------
;Nombre función: flow
;Dominio: id(int) X name(String) X Option(0 o más opciones)
;Recorrido: flow
;Recursión: No aplica
;Descripción: Esta función toma argumentos asociados a un flujo, y retorna el flujo. En el caso de que
;se pasen opciones con un mismo id, el constructor tomara la opción del primer id como valido, siendo este el que se agregara al flujo.
(define (flow id name-msg . Option)
  (if (and (integer? id) (string? name-msg) (list? Option))  
      (list id name-msg (remove-duplicates Option equal-first-code?)) ;Si hay opciones con id duplicado, se considera el primero que encuentre.
      (display "Error, los datos son erroneos asegurate de que tus tipos de datos sean correctos.")))

;------------------------Selectores------------------------
;Nombre función: get-id-flow
;Dominio: flow
;Recorrido: id(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un flujo y retorna el id del flujo

(define get-id-flow (lambda (flujo) (car flujo)))

;Nombre función: get-name-flow
;Dominio: flow
;Recorrido: name-msg(String)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un flujo y retorna el nombre del flujo

(define get-name-msg-flow (lambda (flujo) (cadr flujo)))

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
;Descripción: Esta función toma como argumentos un flujo y una opción, siendo esta ultima agregada al flujo, retornando un flujo con la nueva opción,
;    En el caso de que el flujo ya contenga la opción (verificado por el code) se retorna el mismo flujo que se le entrego a la función.
(define flow-add-option
  (lambda (flujo op)
    (if (not (member (get-code-option op) (map get-code-option (get-Option-flow flujo))))
        (append (list (get-id-flow flujo))
                (list (get-name-msg-flow flujo))
                (list (append (get-Option-flow flujo) (list op))))
        (append (list (get-id-flow flujo))
                (list (get-name-msg-flow flujo))
                (list (get-Option-flow flujo))))))
        






