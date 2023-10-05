#lang racket
(provide (all-defined-out))

;------------------------Constructor------------------------
;Nombre función: option
;Dominio: code(int) X message(String) X ChatbotCodeLink(int) X InitialFlowCodeLink(int) X Keyword(0 o más palabras claves)
;Recorrido: option
;Recursión: No aplica
;Descripción: Esta función toma argumentos asociados a una opción, como podrian ser el codigo de la opción, a su vez retorna una opción como una lista.
;             Para no tener problemas con el case-sensitive se decide
(define option (lambda (code message ChatbotCodeLink InitialFlowCodeLink . Keyword)
      (list code message ChatbotCodeLink InitialFlowCodeLink (map string-downcase Keyword))))
      

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


;Nombre función: get-InitialFlowCodeLink-option
;Dominio: option
;Recorrido: InitialFlowCodeLink(int)
;Recursión: No aplica
;Descripción: Retorna el flujoinicial asociado a una opción
(define (get-InitialFlowCodeLink-option option)
  (cadddr option))


;Nombre función: get-Keywords-option
;Dominio: option
;Recorrido: Keywords(lista)
;Recursión: No aplica
;Descripción: Retorna la lista de palabras claves de la opción
(define (get-Keywords-option option)
  (cadddr (cdr option)))



