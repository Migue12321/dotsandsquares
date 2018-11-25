Given("visito la pagina de gameSettings") do
  visit('/game-settings')
end

Then("deberia ver la pagina con el titulo {string}") do |string|
  expect(page).to have_content(string)
end

Then("deberia ver una etiqueta que diga {string}") do |string|
  expect(page).to have_content(string) 
end
Then("deberia llenarse con {string}") do |string|
  fill_in('username',with: "Bob")
end

Then("deberia ver una segunda etiqueta que diga {string}") do |mensaje|
  expect(page).to have_content(mensaje) 
end

Then("la segunda etiqueta deberia llenarse con {string}") do |string|
  fill_in('username2',with: "Andy")
end

Then("deberia poder ingresar el tamaño del tablero donde dice {string}") do |string|
  expect(page).to have_content(string) 
end

