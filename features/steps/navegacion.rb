require 'watir'
require 'watir-webdriver'

Before do
  $browser ||= Watir::Browser.new
end

Dado(/^que me encuentro en la pagina de registro$/) do
  $browser.goto "http://localhost:3000/register"
end

Cuando(/^facilito mi nombre$/) do
  $browser.text_field(name: "name").set "Herminio"
end

Cuando(/^facilito mi correo electronico$/) do
  $browser.element(xpath: "//input[@type='email']").send_keys "canimus@gmail.com"
end

Cuando(/^facilito mi contraseña$/) do
  $browser.text_field(name: "password").set "welcome"
end

Cuando(/^facilito mi confirmacion de contraseña$/) do
  $browser.text_field(name: "password_confirmation").set "welcome"
end

Cuando(/^oprimo guardar$/) do
  $browser.element(xpath: "//input[@type='submit']").click
end

Entonces(/^debo recibir un mensaje de confirmacion con el texto: "(.*?)"$/) do |msg|
  assert $browser.text.include? msg
end

After do
  $browser.close
end