Feature: Game Settings
    Como jugador
    Quiero ingresar mi nombre de jugador
    Para reconocerme durante la partida

     Scenario: Mostrar la pagina principal
        Given visito la pagina de gameSettings
        Then deberia ver la pagina con el titulo "Bienvenido"
    
     Scenario: Ingresar el nombre del Jugador 1
        Given visito la pagina de gameSettings
        Then deberia ver una etiqueta que diga "Jugador 1:"
        And deberia llenarse con "Bob"

     Scenario: Ingresar el nombre del Jugador 2
        Given visito la pagina de gameSettings
        Then deberia ver una segunda etiqueta que diga "Jugador 2:"
         And la segunda etiqueta deberia llenarse con "Andy"

     Scenario: Ingrese el tamaño del tablero
        Given visito la pagina de gameSettings
        Then deberia poder ingresar el tamaño del tablero donde dice "Ingresa el tamanio del tablero" 

    