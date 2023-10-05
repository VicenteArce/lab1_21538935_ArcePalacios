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






