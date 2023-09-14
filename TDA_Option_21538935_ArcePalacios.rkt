#lang racket
(provide (all-defined-out))
;(define op1 (option 1 "1) Viajar" 2 4 "viajar" "turistear" "conocer"))
;(define op2 (option 2 "2) Estudiar" 4 3 "aprender" "perfeccionarme"))

;------------------------Constructor------------------------
;Nombre función: option
;Dominio: code(int) X message(String) X ChatbotCodeLink(int) X FlowCodeLink(int) X Keyword(0 o más palabras claves)
;Recorrido: option
;Recursión: No aplica
;Descripción: Esta función toma argumentos asociados a una opción, como podrian ser el codigo de la opción, a su vez retorna una opción como una lista.
(define (option code message ChatbotCodeLink  FlowCodeLink . Keyword)
  (if (and (integer? code) (string? message) (integer? ChatbotCodeLink) (integer? FlowCodeLink) (list? Keyword)) 
      (list code message ChatbotCodeLink FlowCodeLink Keyword)
      (display "Error, ingresa bien los datos")))

;------------------------Selectores------------------------
;Nombre función: get-code-option
;Dominio: option
;Recorrido: code(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento una opción y retorna el código de la opción 

(define (get-code-option option)
  (car option))

;Nombre función: get-message-option
;Dominio: option
;Recorrido: message(string)
;Recursión: No aplica
;Descripción: Esta función toma como argumento una opción y retorna el mensaje de la opción
(define (get-message-option option)
  (cadr option))

;Nombre función: get-ChatbotCodeLink-option
;Dominio: option
;Recorrido: ChatbotCodeLink(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento una opción y retorna el codigo del chatbot asociado a la opción
(define (get-ChatbotCodeLink-option option)
  (caddr option))

;Nombre función: get-FlowCodeLink-option
;Dominio: option
;Recorrido: FlowCodeLink(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento una opción y retorna el codigo del flujo asociado a la opción
(define (get-FlowCodeLink-option option)
  (cadddr option))

;Nombre función: get-Keywords-option
;Dominio: option
;Recorrido: Keywords(lista)
;Recursión: No aplica
;Descripción: Retorna la lista de palabras claves de la opción
(define (get-Keywords-option option)
  (cadddr (cdr option)))

;------------------------Pertenencia------------------------
;Nombre función: option?
;Dominio: option
;Recorrido: Bool (#t o #f)
;Recursión: No aplica
;Descripción: Como conocemos con exactitud la estructura de nuestro TDA, basta hacer una simple comparación con cada elemento de la lista option
;El largo de opciones debe ser SIEMPRE 5, code ->int, message->string, ChatobotCodeLink->int, FlowCodeLink->int, Keywords->list
;Cabe destacar que esta función aprovecha de ocupar las funciondes de selección, pero tambien se podria hacer unicamente con cdr.
(define (option? option)
  (if (and (list? option)
           (= (length option) 5)
           (integer? (get-code-option option))
           (string? (get-message-option option))
           (integer? (get-ChatbotCodeLink-option option))
           (integer? (get-FlowCodeLink-option option))
           (list? (get-Keywords-option option)))
           #t #f))




