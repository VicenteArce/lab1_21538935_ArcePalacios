#lang racket

(provide (all-defined-out))
(require "TDA_Option_21538935_ArcePalacios.rkt")
(require "TDA_Flow_21538935_ArcePalacios.rkt")
(require "TDA_chatbot_21538935_ArcePalacios.rkt")
(require "TDA_system_21538935_ArcePalacios.rkt")
(require "TDA_chatHistory_21538935_ArcePalacios.rkt")
(require "TDA_user_21538935_ArcePalacios.rkt")
(require "main.rkt")


;----------------------------------option----------------------------------

;opciones chatbot 0
(define op1 (option 1 "1) Peliculas"  1 1 "Pelicula" "Peliculas" "Movies"))
(define op2 (option 2 "2) Deportes" 2 1 "Futbol" "Basketball" "Deportes"))
(define op3 (option 3 "3) Musica" 3 1 "Musica" "Music"))

;opciones chatbot 1
;opciones flujo 1 chatbot 1
(define op4 (option 1 "1) Accion" 1 2 "Accion" "Action"))
(define op5 (option 2 "2) Terror" 1 3 "Terror" "Horror"))
(define op6 (option 3 "3) Ciencia ficcion" 1 4 "Ciencia ficcion" "Ciencia" "ficcion"))
(define op7 (option 4 "4) Animación" 1 5 "Animacion" "Animation"))
(define op8 (option 5 "5) Volver" 0 1 "volver" "ninguna"))
;opciones flujo 2 chatbot 1
(define op9 (option 1 "1) The Matrix" 1 2 "Matrix" "The Matrix"))
(define op10 (option 2 "2) Jhon Wick" 1 2 "Jhon Wick" "perro"))
(define op11 (option 3 "3) The Dark Night" 1 2 "Batman" "The Dark Night"))
(define op12 (option 4 "4) ninguna pelicula más, volver" 1 1 "volver" "ninguna"))
;opciones flujo 3 chatbot 1
(define op13 (option 1 "1) Insidious" 1 3 "Insidious" "Demonio"))
(define op14 (option 2 "2) El Conjuro" 1 3 "El conjuro" "Conjuro"))
(define op15 (option 3 "3) ninguna pelicula más, volver" 1 1"volver" "ninguna"))
;opciones flujo 4 chatbot 1
(define op16 (option 1 "1) Star Wars" 1 4 "Star Wars" "Galaxia"))
(define op17 (option 2 "2) Interstellar" 1 4 "Intersetellar" "Tiempo"))
(define op18 (option 3 "3) Blade Runner" 1 4 "Blade Runner" "Blade"))
(define op19 (option 4 "4) ninguna pelicula más, volver" 1 1"volver" "ninguna"))
;opciones flujo 5 chatbot 1
(define op20 (option 1 "1) Toy Story" 1 5 "Toy Story" "juguetes"))
(define op21 (option 2 "2) Spider-Man: Into the Spider-Verse" 1 5 "Spider-Man" "Spider-Verse"))
(define op22 (option 3 "3) Ratatouille" 1 5 "rata" "Ratatouille"))
(define op23 (option 4 "4) ninguna pelicula más, volver" 1 1"volver" "ninguna"))

;opciones chatbot 2
;opciones flujo 1 chatbot 2
(define op24 (option 1 "1) Futbol" 2 2 "Futbol" "balon pie" "Soccer"))
(define op25 (option 2 "2) Basketball" 2 3 "Basquetball" "Basketball" "Encestar"))
(define op26 (option 3 "3) Ciclismo" 2 4 "Ciclismo" "Bici" "Bicicleta"))
(define op27 (option 4 "4) Volver" 0 1 "volver" "ninguno"))
;opciones flujo 2 chatbot 2
(define op28 (option 1 "1) Cristiano Ronaldo" 2 2 "Ronaldo" "bicho" "cristiano" "Cristiano Ronaldo"))
(define op29 (option 2 "2) Lionel Messi" 2 2 "Messi" "leo" "lionel" "Lionel Messi"))
(define op30 (option 3 "3) Johan Cruyff" 2 2 "cruyff" "johan" "Johan Cruyff"))
(define op31 (option 4 "4) ningun jugador más, volver" 2 1 "volver" "ninguno"))
;opciones flujo 3 chatbot 2
(define op32 (option 1 "1) Michael Jordan" 2 3 "Jordan" "Michael" "Jordan Michael"))
(define op33 (option 2 "2) Kobe Bryant" 2 3 "Kobe" "Bryant" "Kobe Bryant"))
(define op34 (option 3 "3) Magic Johnson" 2 3 "Magic" "Johnson" "Magic Johnson"))
(define op35 (option 4 "4) ningun jugador más, volver" 2 1 "volver" "ninguno"))
;opciones flujo 4 chatbot 2
(define op36 (option 1 "1) Eddy Merckx" 2 4 "Eddy Mercx" "Eddy"))
(define op37 (option 2 "2) Fausto Coppi" 2 4 "Fausto Coppi" "Fausto"))
(define op38 (option 3 "3) Alberto Contador" 2 4 "Alberto Contador" "alberto"))
(define op39 (option 4 "4) ningun ciclista más, volver" 2 1 "volver" "ninguno"))

;opciones chatbot 3
;opciones flujo 1 chatbot 3
(define op40 (option 1 "1) Hip Hop" 3 2 "Hip Hop" "Rap"))
(define op41 (option 2 "2) Jazz" 3 3 "Jazz"))
(define op42 (option 3 "3) Rock" 3 4))
(define op43 (option 4 "4) Volver" 0 1 "volver" "ninguna"))
;opciones flujo 2 chatbot 3
(define op44 (option 1 "1) Biggie Smalls" 3 2 "Biggie Smalls" "Biggie"))
(define op45 (option 2 "2) Kanye West" 3 2 "Kanye West" "Kanye"))
(define op46 (option 3 "3) 2Pac" 3 2 "2Pac" "Tupac"))
(define op47 (option 4 "4) ningun artista más, volver" 3 1 "volver" "ninguno"))
;opciones flujo 3 chatbot 3
(define op48 (option 1 "1) Louis Armstrong" 3 3 "Louis" "Armstrong"))
(define op49 (option 2 "2) Miles Davis" 3 3 "Miles Davis" "Miles"))
(define op50 (option 3 "3) Sarah Vaughan" 3 3 "Sarah" "Sarah Vaughan"))
(define op51 (option 4 "4) ningun artista más, volver" 3 1 "volver" "ninguno"))
;opciones flujo 4 chatbot 3
(define op52 (option 1 "1) The Beatles" 3 4 "The Beatles"))
(define op53 (option 2 "2) Queen" 3 4 "Queen"))
(define op54 (option 3 "3) Pink Floyd" 3 4 "Pink" "Pink Floyd"))
(define op55 (option 4 "4) ningun artista más, volver" 3 1 "volver" "ninguno"))

;----------------------------------flow----------------------------------

;flujos chatbot 0
(define f1 (flow 1 "Flujo Principal Chatbot 0\nBienvenido\n ¿De que deseas hablar?" op1 op2 op3 op1 op1 op2));Solo introduce una ocurrencia de op1 y op2

;flujos chatbot 1
;flujo 1 chatbot 1
(define f2 (flow 1 "Flujo 1 Chatbot 1\n¿Que tipo de peliculas te gustan?" op4 op5 op6 op7 op8))
;flujo 2 chatbot 1
(define f3 (flow 2 "Flujo 2 Chatbot 1\n¿Cuales son tus peliculas de Accion favoritas?" op9 op10 op11 op12))
;flujo 3 chatbot 1
(define f4 (flow 3 "Flujo 3 Chatbot 1\n¿Cuales son tus peliculas de Terror favoritas?" op13 op14 op15))
;flujo 4 chatbot 1
(define f5 (flow 4 "Flujo 4 Chatbot 1\n¿Cuales son tus peliculas de Ciencia Ficción favoritas?" op16 op17 op18 op19))
;flujo 5 chatbot 1
(define f6 (flow 5 "Flujo 5 Chatbot 1\n¿Cuales son tus peliculas de Animacion favoritas?" op20 op21 op22 op23 ))

;flujos chatbot 2
;flujo 1 chatbot 2
(define f7 (flow 1 "Flujo 1 Chatbot 2\n¿Que deporte te gusta?" op24 op25 op26 op27))
;flujo 2 chatbot 2
(define f8 (flow 2 "Flujo 2 Chatbot 2\n¿Cual es tu futbolista favorito?" op28 op29 op30 op31))
;flujo 3 chatbot 2
(define f9 (flow 3 "Flujo 3 Chatbot 2\n¿Cual es tu basquetbolista favorito?" op32 op33 op34 op35))
;flujo 4 chatbot 2
(define f10 (flow 4 "Flujo 4 Chatbot 2\n¿Cual es tu ciclista favorito?" op36 op37 op38 op39))

;flujos chatbot 3
;flujo 1 chatbot 3
(define f11 (flow 1 "Flujo 1 Chatbot 3\n¿Que tipo de musica te gusta?" op40 op41 op42 op43))
;flujo 2 chatbot 3
(define f99 (flow 2 "Flujo 2 Chatbot 3\n¿Cual es tu rapero favorito?" op44 op45 op46 op47))
;flujo 3 chatbot 3
(define f100 (flow 3 "Flujo 3 Chatbot 3\n¿Cual es tu artista de Jazz favorito?" op48 op49 op50)) ;Falta añadir op51
;flujo 4 chatbot 3
(define f101 (flow 4 "Flujo 4 Chatbot 3\n¿Cual es tu artista de Rock favorito?" op52 op53 op54)) ;falta añadir op55

;----------------------------------flow-add-option----------------------------------

;Intentando añadir opcion duplicada op47 a f99 (no la añade)
(define f12 (flow-add-option f99 op47))
;añadiendo op51 a f100
(define f13 (flow-add-option f100 op51))
;añadiendo op 55 a f101
(define f14 (flow-add-option f101 op55))

;----------------------------------chatbot----------------------------------

;chatbot 0
(define cb0 (chatbot 0 "Chatbot Inicial" "Bienvenido\n¿De que quieres hablar?" 1 f1 f1 f1)) ; Se añade solo una recurrencia de f1
;chatbot 1
(define cb1 (chatbot 1 "Chatbot Peliculas" "Bienvenido\n¿Que tipos de peliculas te gustan?" 1 f2 f3 f4 f5 f6))
;chatbot 2
(define cb2 (chatbot 2 "Chatbot Deportes" "Bienvenido\n¿Que deportes te gustan?" 1 f7 f8 f9 f10))
;chatbot 3
(define cb100 (chatbot 3 "Chatbot Musica" "Bienvenido\n¿Que tipo de Musica te gusta?" 1 f11 f12)) ;Falta añadir f13 y f14

;----------------------------------chatbot-add-flow----------------------------------

;Se intenta añadir a cb100 f11 (no lo añade por que ya esta)
(define cb101 (chatbot-add-flow cb100 f12))
;Añadiendo f13 a cb101
(define cb102 (chatbot-add-flow cb101 f13))
;Añadiendo f14 a cb102
(define cb3 (chatbot-add-flow cb102 f14))

;----------------------------------system----------------------------------

;Creando sistema de ejemplo1
(define s1000 (system "Sistema ejemplo1" 0 cb0 cb0 cb1 cb1 cb2 cb2 cb3));Se añade solo una ocurrencia de cb0, cb1 y cb2
;Creando sistema de ejemplo2
(define s1001 (system "Sistema ejemplo2" 0 cb0 cb0 cb1 cb1 cb2 cb2 cb3 cb3 cb0 cb1)) ;Igual a s1000

;Creando sistema que se usara para las demas funcionalidades
(define s0 (system "Chatbots Paradigmas" 0 cb0 cb1))

;----------------------------------system-add-chatbot----------------------------------

;Intentando añadir cb0 a s1 (no se añade)
(define s1 (system-add-chatbot s0 cb0))
;Añadiendo cb2 a s1
(define s2 (system-add-chatbot s1 cb2))
;Añadiendo cb3 a s2
(define s3 (system-add-chatbot s2 cb3))

;----------------------------------system-add-user----------------------------------

;añadiendo user1
(define s4 (system-add-user s3 "user1"))
;añadiendo user2
(define s5 (system-add-user s4 "user2"))
;intentando añadir nuevamente user2 (no lo añade al ser un usuario que ya se encuentra en el sistema)
(define s6 (system-add-user s5 "user2"))
;añadiendo user3
(define s7 (system-add-user s6 "user3"))

;----------------------------------system-login----------------------------------

;Intentando loguear user4 (como no existe user4 en los registrados no lo loguea)
(define s8 (system-login s7 "user4"))
;logueando user2
(define s9 (system-login s8 "user2"))
;Intentando loguear user1 (como ya hay un user logueado, no se puede ingresar al sistema)
(define s10 (system-login s9 "user1"))

;----------------------------------system-logout----------------------------------

;deslogueando el usuario
(define s11 (system-logout s10))
;deslogueando el usuario (como no hay ningun usuario retorna el mismo sistema
(define s12 (system-logout s11))
;deslogueando el usuario (como no hay ningun usuario retorna el mismo sistema
(define s13 (system-logout s12))

;----------------------------------system-talk-rec----------------------------------

;Al no haber ningun usuario logueado, se retorna el mismo sistema
(define s14 (system-talk-rec s13 "Hola"))
;logueando user2 para hacer pruebas con system-talk-rec
(define s15 (system-login s14 "user2"))
;Se inicia la conversación con el sistema
(define s16 (system-talk-rec s15 "Hola"))
;Se elige la opcion 1 (Peliculas)
(define s17 (system-talk-rec s16 "1"))
;Se elige la opcion 4 (Animacion)
(define s18 (system-talk-rec s17 "animacion"))
;Se elige la opcion 4 (Volver)
(define s19 (system-talk-rec s18 "Volver"))
;Se elige la opcion 5 para volver al chatbot incial (Volver)
(define s20 (system-talk-rec s19 "5"))

;----------------------------------system-talk-norec----------------------------------

;Se elige la opcion 2 (Deportes)
(define s21 (system-talk-rec s20 "deportes"))
;Se elige la opcion 1 (Futbol)
(define s22 (system-talk-rec s21 "1"))
;Se elige la opcion 1 (Cristiano Ronaldo)
(define s23 (system-talk-rec s22 "1"))
;Se hace un system-logout y un sistem login para ver como se guarda el historial de cada usuario
(define s24 (system-logout s23))
(define s25 (system-login s24 "user1"))
;Se inicia la conversacion con el sistema
(define s26 (system-talk-norec s25 "Hola"))
;Se elige la opcion 3 (Musica)
(define s27 (system-talk-norec s26 "Music"))
;Se elige la opcion 1 (Hip Hop)
(define s28 (system-talk-norec s27 "1"))
;Se elige la opcion 1 (Hip Hop)
(define s29 (system-talk-norec s28 "Biggie"))

;----------------------------------system-synthesis----------------------------------

;Se llama a la funcion system-synthesis con un display del "user3" (al no haber interactuado con el sistema retornara un mensaje)
(display (system-synthesis s29 "user3"))
;Se llama a la funcion system-synthesis con un display del "user4" (al no estar en el sistema retornara un mensaje distinto al anterior)
(display (system-synthesis s29 "user4"))
;Se llama a la funcion system-synthesis con un display del "user1"
(display (system-synthesis s29 "user1"))
;Se llama a la funcion system-sythesis con un display del "user2"
(display (system-synthesis s29 "user2"))

;----------------------------------system-simulate----------------------------------

;Se llama a la funcion system-simulate con 3 como maximo de interacciones y 2139128 como semilla junto a un system-sythesis del sistema definido
(define s30 (system-simulate s29 3 2139128))
(display (system-synthesis s30 "user2139128"))
;Se llama a la funcion system-simulate con 5 como maximo de interacciones y 23426 como semilla junto a un system-sythesis del sistema definido
(define s31 (system-simulate s30 5 23426))
(display (system-synthesis s31 "user23426"))
;Se llama a la funcion system-simulate con 4 como maximo de interacciones y 312334 como semilla (Sin mostrar)
(define s32 (system-simulate s30 4 312334))









