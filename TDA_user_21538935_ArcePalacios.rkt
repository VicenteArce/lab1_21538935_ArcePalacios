#lang racket
(provide (all-defined-out))
;------------------------Constructor
(define make-user (lambda (numero) (string-append "user" (number->string numero))))


