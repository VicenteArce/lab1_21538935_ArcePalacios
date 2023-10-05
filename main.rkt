#lang racket

(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")
(require "TDA_chatbot_21538935_ArcePalacios.rkt")
(require "TDA_system_21538935_ArcePalacios.rkt")
(require "TDA_user_21538935_ArcePalacios.rkt")
(require "TDA_chatHistory_21538935_ArcePalacios.rkt")





;Nombre Función: system-talk-rec
;Dominio: system X message
;Recorrido: system
;Recursión: De cola (la recursividad se puede ver implementada en las funciones get-CbotByID, get-FlowByID, get-OptionByID-STR y get-FormatedOptions)
;Descripción: Funcion que toma un sistema y un mensaje, si hay un usuario logeado, entonces se actualizara el sistema, actualizando el actualCbotLink, actualFlowLink y Actualiza el Historial del usuario logeado (String formateado).
;PD: Cuando en el sistema no hay ningun usuario logeado se devolvera el mismo sistema, si hay un usuario logeado entonces ahi se procedera a incluir las modificaciones, en el chatHistory del usuario logeado.
;    Ademas, si ya se hizo la llamada a la funcion y se deslogea el usuario, su chatHistory se guardara y el sistema se "reiniciara", para cuando un usuario proceda a logearse el sistema empiece desde 0

(define system-talk-rec
  (lambda (system message)

    ;Obtiene un chatbot en relacion a un id
    (define get-CbotByID
      (lambda (chatbots ID)
        (if (= (get-chatbotID-chatbot (car chatbots)) ID)
            (car chatbots)
            (get-CbotByID (cdr chatbots) ID))))

    ;Obtiene un flujo en relacion a un id
    (define get-FlowByID
      (lambda (flows ID)
        (if (= (get-id-flow (car flows)) ID)
            (car flows)
            (get-FlowByID (cdr flows) ID))))

    ;Obtiene una opcion en relacion a un id que en este caso, es el mensaje
    (define get-OptionByID-STR
      (lambda (options ID_STR)
        (if (number? (string->number ID_STR))
            (if (= (get-code-option (car options)) (string->number ID_STR))
                (car options)
                (get-OptionByID-STR (cdr options) ID_STR))
            (if (member (string-downcase ID_STR) (get-Keywords-option (car options)))
                (car options)
                (get-OptionByID-STR (cdr options) ID_STR)))))

    ;Funcion que le da formato a un chatHistory
    (define set-Historial-chatHistory (lambda (chatH user message name-chatbot name-flow message-sys)
                                    (if (and (member user (map car chatH)) (equal? user (get-user-chatHistory (car chatH))))
                                        (if (not (empty? (get-Historial-chatHistory (car chatH))))                                            
                                            (append (list (list user (list (string-append (car (get-Historial-chatHistory (car chatH))) "\n" (~v (current-seconds)) "-" user  ": " message "\n"
                                                                                          (~v (current-seconds)) "-" name-chatbot ": " name-flow ": \n " message-sys "\n\n")))) (cdr chatH))                                        
                                            (append (list (list user (list (string-append (~v (current-seconds)) "-" user ": " message "\n"
                                                                                          (~v (current-seconds)) "-" name-chatbot ": " name-flow ": \n " message-sys "\n\n")))) (cdr chatH)))
                                        (append (list (car chatH)) (set-Historial-chatHistory (cdr chatH) user message name-chatbot name-flow message-sys)))))
                                  
    ;Funcion que se encarga de dar formato a las opciones 
    (define get-FormatedOptions
      (lambda (options)
        (string-append* (cdr (append* (map (lambda (x) (list "\n " x))
                                           (map get-message-option options)))))))
    
    (if (= (get-actualFlowCodeLink-system system) -1)    ;Se pregunta si se ha usado el sistema
        (if (not (empty? (get-logUsers-system system)))  ;Si hay usuarios registrados entonces se procede a actualizar el sistema
            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (set-Historial-chatHistory (get-chatHistory-system system)
                                                     (car (get-logUsers-system system))
                                                     message
                                                     (get-name-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))
                                                     (get-name-msg-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))
                                                                                      (get-startFlowId-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))))
                                                     (get-FormatedOptions (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))
                                                                                                         (get-startFlowId-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))))))))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-actualChatbotCodeLink-system system))
                    (list (get-startFlowId-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))))
            
            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (get-chatHistory-system system))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-actualChatbotCodeLink-system system))
                    (list -1)))

        (if (not (empty? (get-logUsers-system system))) ;Como el sistema ya se uso, entonces se tendra en cuenta la actualización de los ChatbotCodeLink Y FlowCodeLink en relacion a la opcion escogida por el usuario (mensaje)
            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (set-Historial-chatHistory (get-chatHistory-system system)
                                                     (car (get-logUsers-system system))
                                                     message
                                                     (get-name-chatbot (get-CbotByID (get-chatbots-system system) (get-ChatbotCodeLink-option (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                     (get-name-msg-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-ChatbotCodeLink-option (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                                                      (get-startFlowId-chatbot (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                     (get-FormatedOptions (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-ChatbotCodeLink-option (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                                                                         (get-startFlowId-chatbot (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message)))))))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-ChatbotCodeLink-option (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message)))
                    (list (get-startFlowId-chatbot (get-OptionByID-STR (get-Option-flow (get-FlowByID (get-flows-chatbot (get-CbotByID (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))

            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (get-chatHistory-system system))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-actualChatbotCodeLink-system system))
                    (list -1))))
    ))


;---------------------------------------------------------------------------------------------------------------------------------------------------
;Nombre Función: system-talk-norec
;Dominio: system X message
;Recorrido: system
;Recursión: No aplica
;Descripción: Funcion que toma un sistema y un mensaje, si hay un usuario logeado, entonces se actualizara el sistema, actualizando el actualCbotLink, actualFlowLink y Actualiza el Historial del usuario logeado (String formateado).
;PD: Cuando en el sistema no hay ningun usuario logeado se devolvera el mismo sistema, si hay un usuario logeado entonces ahi se procedera a incluir las modificaciones, en el chatHistory del usuario logeado.
;    Ademas, si ya se hizo la llamada a la funcion y se deslogea el usuario, su chatHistory se guardara y el sistema se "reiniciara", para cuando un usuario proceda a logearse el sistema empiece desde 0
;   (Si bien la implementacion no usa recursion, si se tienen funciones auxiliares creadas dentro de esta que tampoco usan recursión, cabe destacar que el uso de system-talk-norec o system-talk-rec retornara lo mismo)
;   La unica diferencia en el recorrido entre system-talk-norec y system-talk-rec es que desordenda el orden de los chatHistory, es decir permuta el orden de estos dependiendo de su uso, en la practica esta diferencia no es relevante

(define system-talk-norec
  (lambda (system message)
    (define get-CbotByID-norec
      (lambda(chatbots ID)
        (car (filter (lambda (sublista) (= (get-chatbotID-chatbot sublista) ID)) chatbots)))) 
      
    (define get-FlowByID-norec
      (lambda (flows ID)
        (car (filter (lambda (sublista) (= (get-id-flow sublista) ID)) flows))))

    (define get-OptionByID-STR-norec
      (lambda (options ID_STR)
        (if (number? (string->number ID_STR))
            (car (filter (lambda (sublista) (= (get-id-flow sublista) (string->number ID_STR))) options))
            (car (filter (lambda (sublista) (member (string-downcase ID_STR) (get-Keywords-option sublista))) options)))))

    ;Funcion que se encarga de dar formato a las opciones 
    (define get-FormatedOptions
      (lambda (options)
        (string-append* (cdr (append* (map (lambda (x) (list "\n " x))
                                           (map get-message-option options)))))))

    ;Misma funcion que set-Historial-chatHistory pero de manera NO recursiva
    (define set-Historial-chatHistory-norec (lambda (chatH user message name-chatbot name-flow message-sys)
                         (if (and (member user (map car chatH)) (not (empty? (get-Historial-chatHistory (car (filter (lambda (sublista) (equal? (get-user-chatHistory sublista) user)) chatH))))))
                             (append (filter (lambda (sublista) (not (equal? (car sublista) user))) chatH)
                                     (list (list user (list (string-append (car (get-Historial-chatHistory (car (filter (lambda (sublista) (equal? (car sublista) user)) chatH)))) "\n" (~v (current-seconds)) "-" user  ": " message "\n"
                                                                           (~v (current-seconds)) "-" name-chatbot ": " name-flow ": \n " message-sys "\n\n")))))
                             (append (filter (lambda (sublista) (not (equal? (car sublista) user))) chatH)
                                     (list (list user (list (string-append (~v (current-seconds)) "-" user  ": " message "\n"
                                                                           (~v (current-seconds)) "-" name-chatbot ": " name-flow ": \n " message-sys "\n\n"))))))))

    
    (if (= (get-actualFlowCodeLink-system system) -1)    ;Se pregunta si se ha usado el sistema
        (if (not (empty? (get-logUsers-system system)))  ;Si hay usuarios logueados entonces se procede a actualizar el sistema
            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (set-Historial-chatHistory-norec (get-chatHistory-system system)
                                                     (car (get-logUsers-system system))
                                                     message
                                                     (get-name-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))
                                                     (get-name-msg-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))
                                                                                      (get-startFlowId-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))))
                                                     (get-FormatedOptions (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))
                                                                                                         (get-startFlowId-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))))))))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-actualChatbotCodeLink-system system))
                    (list (get-startFlowId-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system)))))
            
            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (get-chatHistory-system system))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list -1)))

        (if (not (empty? (get-logUsers-system system))) ;Como el sistema ya se uso, entonces se tendra en cuenta la actualización de los ChatbotCodeLink Y FlowCodeLink en relacion a la opcion escogida por el usuario (mensaje)
            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (set-Historial-chatHistory-norec (get-chatHistory-system system)
                                                     (car (get-logUsers-system system))
                                                     message
                                                     (get-name-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-ChatbotCodeLink-option (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                     (get-name-msg-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-ChatbotCodeLink-option (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                                                      (get-startFlowId-chatbot (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                     (get-FormatedOptions (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-ChatbotCodeLink-option (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))
                                                                                                         (get-startFlowId-chatbot (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message)))))))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-ChatbotCodeLink-option (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message)))
                    (list (get-startFlowId-chatbot (get-OptionByID-STR-norec (get-Option-flow (get-FlowByID-norec (get-flows-chatbot (get-CbotByID-norec (get-chatbots-system system) (get-actualChatbotCodeLink-system system))) (get-actualFlowCodeLink-system system))) message))))

            (append (list (get-name-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list (get-chatbots-system system))
                    (list (get-chatHistory-system system))
                    (list (get-users-system system))
                    (list (get-logUsers-system system))
                    (list (get-InitialChatbotCodeLink-system system))
                    (list -1))))
    ))
;---------------------------------------------------------------------------------------------------------------------------------------------------
;Nombre Función: system-synthesis
;Dominio: system X usuario(String)
;Recorrido: String (Formateado para ser visualizado con display)
;Recursión: No aplica
;Descripción: Funcion que retorna el historial como un string de un sistema y usuario dado
(define (system-synthesis system usuario) 
  (if (not (empty? (filter (lambda (sublista) (member usuario sublista)) (get-chatHistory-system system))))
      (if (not (empty? (get-Historial-chatHistory (car (filter (lambda (sublista) (member usuario sublista)) (get-chatHistory-system system))))))
          (string-append "\n---------" (string-upcase usuario) "---------\n" (car (get-Historial-chatHistory (car (filter (lambda (sublista) (member usuario sublista)) (get-chatHistory-system system))))))
          (string-append "\n---------" (string-upcase usuario) "---------\n" "Tu usuario no tiene un historial\n"))
      (string-append "\n---------" (string-upcase usuario) "---------\n" "Tu usuario no esta registrado en el sistema\n")))

;---------------------------------------------------------------------------------------------------------------------------------------------------
;Nombre función: myRandom
;Dominio: Xn: (int)
;Recorrido: int
;Recursión: No aplica
;Descripción: Función que retorna un número pseudoaleatorio.

(define (myRandom Xn)
  (modulo (+ (* 1103515245 Xn) 12345) 2147483648)
)


;Nombre Función: system-simulate
;Dominio: system X maxInteractions(int) X seed(int)
;Recorido: system
;Recursión: De cola
;Descrición: Función que dado un sistema, un maximo de interacciones y una semilla, hace una simulación de una interacción con un sistema, retornando un sistema con un nuevo "user + seed" que tendra un historial de la conversación con el sistema.
(define system-simulate
  (lambda (system maxInteractions seed)
   
    (define get-CbotByID-ss
      (lambda(chatbots ID)
        (car (filter (lambda (sublista) (= (get-chatbotID-chatbot sublista) ID)) chatbots))))
    
     (define get-FlowByID-ss
      (lambda (flows ID)
        (car (filter (lambda (sublista) (= (get-id-flow sublista) ID)) flows))))

    (define obtener-mayor-ss
      (lambda (lista)
        (if (empty? (cdr lista))
            (car lista)
            (if (> (car lista) (cadr lista))
                (obtener-mayor-ss (remove (cadr lista) lista))
                (obtener-mayor-ss (remove (car lista) lista ))))))
    
    (define (NumberOptions-ss system actualCbotCodeLink actualFlowCodeLink)
      (obtener-mayor-ss (map get-code-option (get-Option-flow (get-FlowByID-ss (get-flows-chatbot (get-CbotByID-ss (get-chatbots-system system) actualCbotCodeLink)) actualFlowCodeLink)))))

    (define set-RandomChoose
      (lambda (seed system actualCbotCodeLink actualFlowCodeLink)
        (+ 1 (modulo (myRandom seed) (NumberOptions-ss system actualCbotCodeLink actualFlowCodeLink)))))
    
    (if (not (< maxInteractions 0))
             (if (empty? (cdddr (cdddr (cddr system))))
                 (system-simulate (append (system-talk-rec (system-login (system-add-user (system-logout system) (make-user seed)) (make-user seed)) "Hola") (list seed)) (- maxInteractions 1) seed)
                 (system-simulate (append (system-talk-rec system (number->string (set-RandomChoose seed system (get-actualChatbotCodeLink-system system) (get-actualFlowCodeLink-system system)))) (list (cadddr (cdddr (cddr system))) )) (- maxInteractions 1) (myRandom seed)))
             (system-logout system))))


