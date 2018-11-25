require "./lib/Game"

describe Game do
    @Game
    @Table

    before do
        @Game = Game.new()
        @Table= [ '0000F','0000F','0000F','0000F','0000F','0000F','0000F','0000F','0000F']
    end
    
    it "Deberia dibujar el juego con 0 jugadas" do
        expect(@Game.initGame(3,3)).to eq @Table
    end

    it "Deberia establecer en 1 la posicion 0 del array cuando llamo a insert move" do
        expect(@Game.insertMove(0,'0000F')).to eq '1000F'
    end

    it "Deberia insertar 1000F en la posicion 0 del tablero retornando como respuesta exitosa 1" do
        expect(@Game.insertSpace(0,'1000F')).to eq 1
    end

    it "Deberia retornar -1 si se trata de sobrescribir una jugada izquierda en la posicion 1" do
        expect(@Game.play('L',1)).to eq -1
    end

    it "Deberia retornar 1 si se logro realizar la jugada derecha posicion en la 1" do
        expect(@Game.play('R',1)).to eq 1
    end

    it "Deberia retornar -1 si se trata de sobrescribir una jugada derecha en la posicion 1" do
        expect(@Game.play('R',1)).to eq -1
    end

    it "Deberia retornar 1 si se logro realizar la jugada arriba posicion en la 1" do
        expect(@Game.play('U',1)).to eq 1
    end

    it "Deberia retornar -1 si se trata de sobrescribir una jugada arriba posicion en la 1" do
        expect(@Game.play('U',1)).to eq -1
    end

    it "Deberia establecer en T si se llama a setTrue" do
        expect(@Game.setTrue('1111F')).to eq '1111T'
    end

    it "Deberia retornar -1 si se llama a setTrue y T ya ha sido establecido" do
        expect(@Game.setTrue('1111T')).to eq -1
    end

    # it "Deberia retornar 2 si se logro realizar la jugada abajo en la posicion 1 y ademas se lleno todos los ceros del array '0000F' por un 2" do
    #     expect(@Game.play('D',1)).to eq 2
    # end

    # it "Deberia retornar -1 si se trata de sobrescribir una jugada abajo posicion 1" do
    #     expect(@Game.play('D',1)).to eq -1
    # end

    it "Deberia retornar la tabla actual" do
        @Table= [ '1101F','0000F','0000F','0000F','0000F','0000F','0000F','0000F','0000F']
        expect(@Game.returnActualTable()).to eq @Table
    end

    it "Al iniciar el juego se debe crear al jugador 1" do
        expect(@Game.addUser("Andrea","98772")).to eq "Andrea"
    end     

    it "Al iniciar el juego se debe crear al jugador 2" do 
        expect(@Game.addUser("Maria","9772")).to eq "Maria"
    end 

    it "Cuando el jugador 1 realiza una jugada debe pasar el turno" do
        expect(@Game.changePlayer()).to eq 2
    end 

    it "Cuando el jugador 2 realiza una jugada debe pasar el turno" do 
        expect(@Game.changePlayer()).to eq 1
    end 

    it "Cuando  completo un cuadrado se debe sumar un punto en mi puntaje" do 
        expect(@Game.addScore(1)).to eq 1
    end 

    it "Cuando completo dos cuadrados se debe sumar un punto en mi puntaje" do 
        @Game.addScore(1)
        expect(@Game.addScore(1)).to eq 3
    end

    it "Cuando se realiza una jugada llamando a dotsAndBoxes en la posicion U deberia retornar true si esta fue correcta" do
        expect(@Game.dotsAndBoxes(2,1,'U')).to eq true
    end

    it "Cuando se realiza una jugada llamando a dotsAndBoxes en la posicion D deberia retornar true si esta fue correcta" do
        expect(@Game.dotsAndBoxes(2,1,'D')).to eq true
    end

    it "Cuando se realiza una jugada llamando a dotsAndBoxes en la posicion L deberia retornar true si esta fue correcta" do
        expect(@Game.dotsAndBoxes(2,1,'L')).to eq true
    end

    it "Cuando se realiza una jugada llamando a dotsAndBoxes en la posicion R deberia retornar true si esta fue correcta" do
        expect(@Game.dotsAndBoxes(2,1,'R')).to eq true
    end

    it "Cuando quiera resetear el juego llamo a la funcion reset y esta me devuelve true si fue correcta" do
        expect(@Game.reset()).to eq true
    end
end