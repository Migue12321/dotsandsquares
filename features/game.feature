Feature: Game
    Como jugador
    Quiero Ver el tablero 
    Para poder realizar una jugada

    Scenario: Mostrar la pantalla
        Given visito la pagina de juego
        Then deberia ver una pagina con mis nombres de usuario

    Scenario: Ver el tablero
        Given visito la pagina de juego
        Then deberia poder ver una tabla
        
    Scenario: Mostrar Jugador 1
        Given visito la pagina de gameSettings
        And llene el campo Jugador1: con el nombre "Bob" 
        When presione el boton "Empezar" que me llevo a la pagina /game
        Then deberia mostrar el nombre "Bob"

     Scenario: Mostrar Jugador 2
        Given visito la pagina de gameSettings
        And llene el campo de texto del Jugador2: con el nombre "Andy" 
        When presione el boton "Empezar" que me llevo a la pagina /game
        Then deberia mostrar el nombre "Andy"
    
    Scenario: Mostrar Jugador 3
        Given visito la pagina de gameSettings
        And llene el campo de texto del Jugador2: con el nombre "Mauri" 
        When presione el boton "Empezar" que me llevo a la pagina /game
        Then deberia mostrar el nombre "Mauri"

    Scenario: Mostrar color del jugador 1
        Given visito la pagina de gameSettings
        And elijo el color "red" para el Jugador1 
        When presione el boton "Empezar" que me llevo a la pagina /game
        Then deberia mostrar el nombre con el color "red"

    Scenario: Marcar jugada
        Given visito la pagina de "/game-settings" para seleccionar un tablero de 3
        When aprieto el boton "11up" de la primera casilla
        Then marca una linea en la parte superior de la casilla  
    
    Scenario: Marcar punto
        Given visito la pagina de gameSettings
        And llene el campo Jugador1: con el nombre "Bob" 
        And selecciono un tablero de 3
        And presione el boton "Empezar" que me llevo a la pagina /game
        And aprieto el boton "11down" de la primera casilla
        And aprieto el boton "11left" de la primera casilla
        And aprieto el boton "11right" de la primera casilla
        And aprieto el boton "11up" de la primera casilla
    