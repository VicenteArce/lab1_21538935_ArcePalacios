#lang racket
(provide (all-defined-out))

;------------------------Constructor------------------------
;Nombre función: chatHistory
;Dominio: user 
;Recorrido: chatHistory
;Recursión: no aplica
;Descripción: Función que retorna una lista que contiene un usuario y un hitorial relacionado a este

(define chatHistory (lambda (user) (list user '())))



;------------------------Selectores------------------------
;Nombre función: get-user-chatHistory
;Dominio: chatHistory
;Recorrido: user (String)
;Recursión: no aplica
;Descripción: Retorna el usuario de un chatHistory
(define get-user-chatHistory (lambda (chatHistory) (car chatHistory)))


;Nombre función: get-Historial-chatHistory
;Dominio:chatHistory
;Recorrido: chatHistory
;Recursion: no aplica
;Descripción: Retorna el historial de un usuario
(define get-Historial-chatHistory (lambda (chatHistory) (cadr chatHistory)))


;------------------------Modificadores------------------------
;Nombre add-chatHistory-user
;Dominio:chatHistory X user(String) X message(String) X name-chatbot(String) X name-flow(String) X message-sys(String de opciones)
;Recorrido: chatHistory
;Recursion: Natural (deja estado pensdiente hata encontrar el usuario)
;Descripción: Retorna el historial añadiendo texto al hitsorial de un usuario dado

(define set-Historial-chatHistory (lambda (chatH user message name-chatbot name-flow message-sys)
                                    (if (and (member user (map car chatH)) (equal? user (get-user-chatHistory (car chatH))))
                                        (if (not (empty? (get-Historial-chatHistory (car chatH))))                                            
                                            (append (list (list user (list (string-append (car (get-Historial-chatHistory (car chatH))) "\n" (~v (current-seconds)) "-" user  ": " message "\n"
                                                                                          (~v (current-seconds)) "-" name-chatbot ": " name-flow ": \n " message-sys "\n\n")))) (cdr chatH))                                        
                                            (append (list (list user (list (string-append (~v (current-seconds)) "-" user ": " message "\n"
                                                                                          (~v (current-seconds)) "-" name-chatbot ": " name-flow ": \n " message-sys "\n\n")))) (cdr chatH)))
                                        (append (list (car chatH)) (set-Historial-chatHistory (cdr chatH) user message name-chatbot name-flow message-sys)))))
                                  







