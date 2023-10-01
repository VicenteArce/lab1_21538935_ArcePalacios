#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")



;------------------------Otras funciones------------------------
;Nombre función: equal-first-id?
;Dominio: l1 (lista) X l2 (lista)
;Recorrido: bool
;Recursión: no applica
;Descripción: Función que compara los primeros dos elementos de una lista, función declarada para ser usada en el constructor del chatbot.
;         Sirve en conjunto a la funcion remove-duplicates para la verificación de un id único de un flujo en un chatbot.
(define (equal-first-id? l1 l2)
  (equal? (get-id-flow l1) (get-id-flow l2)))

;------------------Constructor------------------
;Nombre función: chatbot
;Dominio: chatbotID(int) X name(String) X welcomeMessage(String) X startFlowId(int) X flows(0 o más opciones)
;Recorrido: chatbot
;Recursión: No aplica
;Descripción: Esta función toma argumentos asociados a un chatbot, y retorna el chatbot.
(define chatbot (lambda (chatbotID name welcomeMessage startFlowId . flows)
  (list chatbotID name welcomeMessage startFlowId (remove-duplicates flows equal-first-id?))))

;-----------------Selectores--------------------
;Nombre función: get-id-chatbot
;Dominio: chatbot
;Recorrido: id(int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna el id del chatbot
(define get-chatbotID-chatbot
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


;Nombre función: get-initialFlowCode-chatbot
;Dominio: chatbot
;Recorrido: initialFlowCode (int)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna una lista de flujos del chatbot
(define get-startFlowId-chatbot
  (lambda (cbot)
    (cadddr cbot)))

;Nombre función: get-flows-chatbot
;Dominio: chatbot
;Recorrido: flujos(lista de 0  o más elementos)
;Recursión: No aplica
;Descripción: Esta función toma como argumento un chatbot y retorna una lista de flujos del chatbot
(define get-flows-chatbot
  (lambda (cbot)
    (cadddr (cdr cbot))))

;------------------------Modificadores---------------------
;Nombre función: chatbot-add-flow
;Dominio: chatbot X flow
;Recorrido: chatbot 
;Recursión: natural (llamada a función append-final)
;Descripción: Función que toma un chatbot y un flujo, al ser llamada esta función se creara un chatbot identico al anterior pero agregando el flujo que se le pase.
;      En caso de que el chatbot ya contenia el flujo (verificado por el id del flujo) entonces se retorna el mismo chatbot que se le ingreso a la función.

(define chatbot-add-flow
  (lambda (chatbot flow)
    (define (append-final flujo lista-flujos-chatbot)
      (if (null? lista-flujos-chatbot)
          (list flujo)
          (cons (car lista-flujos-chatbot) (append-final flujo (cdr lista-flujos-chatbot)))))

    (if (not (member (get-id-flow flow) (map get-id-flow (get-flows-chatbot chatbot))))
        (append (list (get-chatbotID-chatbot chatbot))
                (list (get-name-chatbot chatbot))
                (list (get-welcomeMessage-chatbot chatbot))
                (list (get-startFlowId-chatbot chatbot))
                (list (append-final flow (get-flows-chatbot chatbot))))
        (append (list (get-chatbotID-chatbot chatbot))
                (list (get-name-chatbot chatbot))
                (list (get-welcomeMessage-chatbot chatbot))
                (list (get-startFlowId-chatbot chatbot))
                (list (get-flows-chatbot chatbot)))
        )))











