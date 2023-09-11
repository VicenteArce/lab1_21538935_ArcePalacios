#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")

;------------------Constructor------------------
;Nombre función: chatbot
;Dominio: name(String) X welcomeMessage(String) X flows(0 o más opciones)
;Recorrido: chatbot
;Recursión: No aplica
;Descripción: Esta función toma argumentos asociados a un chatbot, y retorna el chatbot.
(define (chatbot name welcomeMessage . flows)
      (list 1 name welcomeMessage flows)) ;El 1 es el ID, de momento esta como PLACEHOLDER


;-----------------Selectores--------------------
;Nombre función: get-id-chatbot
;Dominio: chatbot
;Recorrido: id(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna el id del chatbot
(define get-id-chatbot
  (lambda (cbot)
    (car cbot)))

;Nombre función: get-name-chatbot
;Dominio: chatbot
;Recorrido: name(String)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna el nombre del chatbot
(define get-name-chatbot
  (lambda (cbot)
    (cadr cbot)))

;Nombre función: get-welcomeMessage-chatbot
;Dominio: chatbot
;Recorrido: welcomeMessage(String)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna el mensaje de bienvenida del chatbot
(define get-welcomeMessage-chatbot
  (lambda (cbot)
    (caddr cbot)))

;Nombre función: get-flows-chatbot
;Dominio: chatbot
;Recorrido: flujos(lista de 0  o más elementos)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna una lista de flujos del chatbot
(define get-flows-chatbot
  (lambda (cbot)
    (cadddr cbot)))


;--------------Modificadores-------------------
;Nombre función: chatbot-add-flow
;Dominio: chatbot X flow
;Recorrido: chatbot 
;Recursión: ;------------------;
;Descripción: ;---------------------------;

