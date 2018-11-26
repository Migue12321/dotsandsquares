Feature: Game Settings
    Como jugador
    Quiero seleccionar la cantidad de oponentes
    Para jugar con 1, 2 o 3 contrincantes

     Scenario: Mostrar la pagina de numero de jugadores
        Given visito la pagina de numerojugadores
        Then deberia ver la pagina con el titulo "Numero de jugadores:"

    Scenario: ingresar datos de 2 personas
        Given visito la pagina de numerojugadores
        And presiono el boton de jugadores "2"
        Then deberia direccionarme a la pagina '/game-settings' 

    Scenario: ingresar datos de 3 personas
        Given visito la pagina de numerojugadores
        And presiono el boton de jugadores "3"
        Then deberia direccionarme a la pagina '/game-settings-3' 

 