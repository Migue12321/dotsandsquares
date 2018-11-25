Given("visito la pagina principal") do
  visit('/')
end

Then("deberia ver el nombre {string}") do |nombre|
  expect(page).to have_content(nombre)
end

When("presiono el boton {string}") do |boton|
  click_button(boton)
end

Then(" deberia direccionarme a la pagina {string}") do |mensaje|
  visit('/players')
end