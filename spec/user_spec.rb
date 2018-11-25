require "./lib/user"

describe User do

    before do
        @user = User.new()
    end

    it "Al inicio el usuario deberia tener nombre vacio" do
        expect(@user.getUsername()).to eq nil
    end

    it "Cuando me registro, deberia mostrarme mi nombre" do
        @user.addUser("andrea","98765")
        expect(@user.getUsername()).to eq "andrea"
    end

    it "Cuando me registro, deberia mostrar el color que he elegido" do 
        @user.addUser("andrea","98765")
        expect(@user.getColor()).to eq "98765"
    end 

    it "Al Inicio del juego mi puntaje deberia ser 0" do
        @user.iniciarScore()
        expect(@user.getScore()).to eq 0
    end

    it "Cuando arme un cuadrado mi puntaje daberia ser 1" do
        @user.iniciarScore()
        @user.addScore(1)
        expect(@user.getScore()).to eq 1
    end

    it "Cuando arme dos cuadrados mi puntaje deberia ser 2" do 
        @user.iniciarScore()
        @user.addScore(1)
        @user.addScore(1)
        expect(@user.getScore()).to eq 2
    end
end 