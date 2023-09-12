#lang racket
(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")
(require "TDA_chatbot_21538935_ArcePalacios.rkt")

;------------------------Constructor------------------------
(define (system name InitialChatbotCodeLink . chatbot)
  (list name InitialChatbotCodeLink chatbot))