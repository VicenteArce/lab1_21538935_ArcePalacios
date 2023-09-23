#lang racket

;------------------------Constructor
(define user (lambda (name) (list name)))


;------------------------Selector
(define get-user (lambda (user) (car user)))

;------------------------Modificador
(define set-user (lambda (user name) (list name)))