#language: es
#encoding: utf-8

Característica: Registro de nuevas cuentas de usuario
Como usuario de HIR Casa
al llenar el formulario de registro
debo obtener un mensaje de confirmacion
creando mi cuenta
y dejandola pendiente de activacion

Escenario: Registro de usuarios
Dado que me encuentro en la pagina de registro
Cuando facilito mi nombre
Y facilito mi correo electronico
Y facilito mi contraseña
Y facilito mi confirmacion de contraseña
Y oprimo guardar
Entonces debo recibir un mensaje de confirmacion con el texto: "Cuenta de usuario creada"
