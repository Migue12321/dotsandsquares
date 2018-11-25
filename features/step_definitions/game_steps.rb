  Given("visito la pagina de juego") do
      visit('/game')
  end
  
  Then("deberia ver una pagina con mis nombres de usuario") do
    expect(page).to have_xpath('//h2')
  end
  
  Then("deberia poder ver una tabla") do
    expect(page).to have_xpath('//div')
  end
  

  Given("Given visito la pagina de gameSettings") do
     visit("/gameSettings")
  end  

  Given("llene el campo Jugador{int}: con el nombre {string}") do |int, string|
     fill_in('username', with: string)
  end  
 
  When("presione el boton {string} que me llevo a la pagina \/game") do |string|
    click_button(string)
  end
  
  Then("deberia mostrar el nombre {string}") do |string|
    expect(page).to have_content(string) 
  end

  Given("llene el campo de texto del Jugador{int}: con el nombre {string}") do |int, string|
    fill_in('username2', with: string)
  end
  
  Given("elijo el color {string} para el Jugador{int}") do |string, int|
    fill_in('color1', with: string)
  end
  
  Then("deberia mostrar el nombre con el color {string}") do |string|
   page.assert_all_of_selectors('h5.'+string) 
  end