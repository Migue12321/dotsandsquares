  Given("visito la pagina de numerojugadores") do
   visit('/players')
  end

  Given("presiono el boton de jugadores {string}") do |string|
     page.assert_all_of_selectors('button#'+string) 
  end
  
  Then("deberia direccionarme a la pagina {string}") do |string|
    visit(string)
  end
  