Feature: Bienvenida
    Como usuario
    Quiero ver un el nombre de la aplicacion
    Para sentirme a gusto al entrar

    Scenario: nombre de la aplicacion
        Given visito la pagina principal
        Then deberia ver el nombre "Dots and squares"
    
    Scenario: boton Star new Game
        Given visito la pagina principal
        When presiono el boton "START NEW GAME"
        Then deberia direccionarme a la pagina "numerojugadores"
     