require "./lib/Bienvenida"

describe Bienvenida do

    before do
        @bn = Bienvenida.new()
    end

    it "Al el titulo debe ser vacio" do
        expect(@bn.getTitle()).to eq nil
    end

    it "Cuando Ingreso el titulo deberia mostrarmelo" do 
        @bn.addTitle("Binvenido a la aplicacion")
        expect(@bn.getTitle()).to eq "Binvenido a la aplicacion"
    end

    it "Cuando ingreso el nombre de boton deberia mostrarlo" do
        @bn.addBottonName("Ingresa")
        expect(@bn.getBottonName()).to eq "Ingresa"
    end
end
