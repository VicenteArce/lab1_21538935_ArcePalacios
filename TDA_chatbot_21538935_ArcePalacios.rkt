#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")



;------------------------Otras funciones------------------------
;Nombre función: append-final
;Dominio; flow X lista(de flujos del chatbot)
;Recorrido: chatbot
;Recursión: no aplica
;Descripción: Esta función se llama en el modificador para poder agregar al final de la lista de flujos el nuevo flujo en cuestion

(define (append-final flujo lista-flujos-chatbot)
  (if (null? lista-flujos-chatbot)
      (list flujo)
      (cons (car lista-flujos-chatbot) (append-final flujo (cdr lista-flujos-chatbot)))))

;------------------Constructor------------------
;Nombre función: chatbot
;Dominio: chatbotID(int) X name(String) X welcomeMessage(String) X flows(0 o más opciones)
;Recorrido: chatbot
;Recursión: No aplica?? (uso de la función reps option
;Descripción: Esta función toma argumentos asociados a un chatbot, y retorna el chatbot.
(define (chatbot chatbotID name welcomeMessage . flows)
  (if (and (integer? chatbotID) (string? name) (string? welcomeMessage) (list? flows))
      (list chatbotID name welcomeMessage (remove-duplicates flows))
      (display "Error, los datos son erroneos, verifica si los tipos de datos son correctos")))

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
;Recursión: de cola (append-final)
;Descripción: Función que toma un chatbot y un flujo, al ser llamada esta función se creara un chatbot identico al anterior pero agregando el flujo que se le pase.

(define chatbot-add-flow
  (lambda (chatbot flow)
    (if (not (member (get-id-flow flow) (map get-id-flow (get-flows-chatbot chatbot))))
        (append (list (get-id-chatbot chatbot))
                (list (get-name-chatbot chatbot))
                (list (get-welcomeMessage-chatbot chatbot))
                (list(append-final flow (get-flows-chatbot chatbot))))
        (display "Error, el flujo que intentas añadir ya se encuentra en el chatbot")
        )))











