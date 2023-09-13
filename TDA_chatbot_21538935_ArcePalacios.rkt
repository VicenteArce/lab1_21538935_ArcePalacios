#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")



;------------------------Otras funciones------------------------
;Nombre funcion:reps-flow?
;Dominio: lista (para este caso la lista que se recibira sera la de flujos, esto para descartar flujos repetidos
;Recorrido: Booleano
;Recursión: De cola
;Descripción: Esta funcion sirve para verificar si existen elementos repetidos en una lista, para este caso, sirve para verificar si
;             los flujos a agregar tienen el mismo id o no, es decir, retorna #t en el caso de que existan elementos iguales,
;             retorna #f en el caso de que no existan elementos iguales en la lista.

(define (reps-flow? lista)
  (define (aux element lista)
    (cond
      ((null? lista) #f) 
      ((equal? element (car lista)) #t) 
      (else (aux element (cdr lista))))) 
  (cond
    ((null? lista) #f) ;
    ((aux (car lista) (cdr lista)) #t) 
    (else (reps-flow? (cdr lista)))))

;Nombre función: append-final
;Dominio; flow X lista(de flujos del chatbot)
;Recorrido: chatbot
;Recursión: De cola
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
  (if (and (integer? chatbotID) (string? name) (string? welcomeMessage) (list? flows) (not (reps-flow? (map car flows))))
      (list chatbotID name welcomeMessage flows)
      (display "Error, los datos son erroneos, verifica si los tipos de datos son correctos o si tus flujos no estan repetidos")))

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




;(define op1 (option 1 "1) Viajar" 2 4 "viajar" "turistear" "conocer"))
;(define op2 (option 2 "2) Estudiar" 4 3 "aprender" "perfeccionarme"))
;(define f12 (flow  1 "Flujo1" op1 op2))

;(define f13 (flow 2 "Flujo 2" op1 op2))

;(define cb10 (chatbot 0 "Asistente" "Bienvenido\n¿Qué te gustaría hacer?" f12))
;cb10
;(define cb11 (chatbot 1 "chatbot 1" "Bienvenido\n¿Qué te gustaría hacer?"))







