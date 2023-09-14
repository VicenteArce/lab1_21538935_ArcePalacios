#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")
(require "TDA_chatbot_21538935_ArcePalacios.rkt")




;------------------------Otras funciones------------------------
;Nombre función: equal-first-chatbotID?
;Dominio: l1 (lista) X l2 (lista)
;Recorrido: bool
;Recursión: no applica
;Descripción: Funcion que compara los primeros dos elementos de una lista, función declarada para ser usada en el constructor del chatbot
;         Sirve en conjunto a la funcion remove-duplicates para la verificación de un id unico de un flujo en un chatbot.
(define (equal-first-chatbotID? l1 l2)
  (equal? (get-chatbotID-chatbot l1) (get-chatbotID-chatbot l2)))

;------------------------Constructor------------------------
;Nombre de Función: system
;Dominio: name(String) X InitialChatbotCodeLink(int) X chatbot (0 o más chatbot)
;Recorrido: system
;Recursión: de cola (al verificar si existen chatbots repetidos
;Descripción: Función constructora de sistemas que contienen chatbots, historial de chats y usuarios

(define (system name InitialChatbotCodeLink . chatbot)
  (if (and (string? name) (integer? InitialChatbotCodeLink) (list? chatbot) )
      (list name InitialChatbotCodeLink (remove-duplicates chatbot equal-first-chatbotID?) '() '() '()) ;Las tres listas vacias son: chatHistory, usuarios en el sistema, usuarios logeados
      (display "Error, ingresa bien los datos")))

;------------------------Selectores------------------------
;Nombre de Función: get-name-system
;Dominio: system 
;Recorrido: name
;Recursión: no aplica
;Descripción: Retorna el nombre de un sistema dado
(define get-name-system
  (lambda (system)
    (car system)))

;Nombre de Función: get-InitialChatbotCodeLink-system
;Dominio: system 
;Recorrido: InitialChatbotCodeLink
;Recursión: no aplica
;Descripción: Retorna el codigo de chatbot inicial de un sistema dado
(define get-InitialChatbotCodeLink-system
  (lambda (system)
    (cadr system)))

;Nombre de Función: get-chatbots-sytem
;Dominio: system 
;Recorrido: chatbots
;Recursión: no aplica
;Descripción: Retorna la lista de chatbots de un sistema dado
(define get-chatbots-system
  (lambda (system)
    (caddr system)))

;Nombre de Función: get-chatHistory-system
;Dominio: system 
;Recorrido: chatHistory
;Recursión: no aplica
;Descripción: Retorna la lista de chatHistory de un sistema dado
(define get-chatHistory-system
  (lambda (system)
    (cadddr system)))

;Nombre de Función: get-users-system
;Dominio: system 
;Recorrido: users
;Recursión: no aplica
;Descripción: Retorna la lista de usuarios registrados en un sistema dado
(define get-users-system
  (lambda (system)
    (cadddr (cdr system))))

(define get-logUsers-system
  (lambda (system)
    (cadddr (cddr system))))


;------------------------Modificadores------------------------
;Nombre de Función: system-add-chatbot
;Dominio: system X chatbot
;Recorrido: system
;Recursión: no aplica
;Descripción: Función que permite agregar un nuevo chatbot a un sistema, a su vez se verifica que el chatbot no este en el sistema

(define system-add-chatbot
  (lambda (system chatbot)
    (if (not (member (get-chatbotID-chatbot chatbot) (map get-chatbotID-chatbot (get-chatbots-system system))))
        (append (list (get-name-system system))
                (list (get-InitialChatbotCodeLink-system system))
                (list (append (get-chatbots-system system) (list chatbot)))
                (list (get-chatHistory-system system))
                (list (get-users-system system))
                (list (get-logUsers-system system)))
        (append (list (get-name-system system))
                (list (get-InitialChatbotCodeLink-system system))
                (list (get-chatbots-system system))
                (list (get-chatHistory-system system))
                (list (get-users-system system))
                (list (get-logUsers-system system))))))

;Nombre función: system-add-user
;Dominio: system X user(String)
;Recorrido: system
;Recursión: no aplica
;Descripción: Permite la creación de un usuario en un sistema almacenandose en una lista, a su vez al crearse un usuario, automaticamente se crea un historial de la forma ((user (hist))(user2 (hist2))

(define system-add-user
  (lambda (system user)
    (if (not (member user (get-users-system system)))
        (append (list (get-name-system system))
                (list (get-InitialChatbotCodeLink-system system))
                (list (get-chatbots-system system))
                (list (get-chatHistory-system system))
                (list (append (get-users-system system) (list user)))
                (list (get-logUsers-system system)))
        (append (list (get-name-system system))
                (list (get-InitialChatbotCodeLink-system system))
                (list (get-chatbots-system system))
                (list (get-chatHistory-system system))
                (list (get-users-system system))
                (list (get-logUsers-system system))))))

;Nombre función: system-login
;Dominio: system X user(String)
;Recorrido: system
;Recursión: no aplica
;Descripción: Retorna el mismo sistema pero logueando en el sistema el usuario dado, esto ocurre solo si el usuario esta registrado y si no hay ningun usuario registrado

(define system-login
  (lambda (system user)
    (if (and (member user (get-users-system system)) (empty? (get-logUsers-system system)))
        (append (list (get-name-system system))
                (list (get-InitialChatbotCodeLink-system system))
                (list (get-chatbots-system system))
                (list (get-chatHistory-system system))
                (list (get-users-system system))
                (list (append (get-logUsers-system system) (list user))))
        (append (list (get-name-system system))
                (list (get-InitialChatbotCodeLink-system system))
                (list (get-chatbots-system system))
                (list (get-chatHistory-system system))
                (list (get-users-system system))
                (list (get-logUsers-system system))))))


;Nombre función: system-logout
;Dominio: system 
;Recorrido: system
;Recursión: no aplica
;Descripción: Retorna el mismo sistema pero sin usuarios logueados

(define system-logout
  (lambda (system)
    (append (list (get-name-system system))
            (list (get-InitialChatbotCodeLink-system system))
            (list (get-chatbots-system system))
            (list (get-chatHistory-system system))
            (list (get-users-system system))
            (list (cdr (get-logUsers-system system))))))




