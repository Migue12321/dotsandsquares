  Given("visito la pagina de numerojugadores") do
   visit('/players')
  end

  Given("presiono el boton para jugadores {string}") do |string|
        click_button(string)
  end
  
  Then("deberia direccionarme a la pagina {string}") do |string|
    visit(string)
    
  end
  Given("presiono el boton de jugadores {string}") do |string|
    click_button(string)
  end
  