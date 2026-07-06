# language: es
# Historia no funcional HU-NF04 · Seguridad de autenticación
Característica: Seguridad de autenticación
  Como administrador del sistema
  Quiero que la autenticación sea segura
  Para proteger las cuentas y la información de los usuarios

  Escenario: Autenticación sin almacenar contraseñas (normal)
    Dado que inicio sesión con mi correo institucional
    Cuando me autentico mediante SSO/OAuth 2.0
    Entonces el sistema me da acceso sin almacenar mi contraseña en la aplicación

  Escenario: Bloqueo temporal por intentos fallidos (excepcional)
    Dado que ingreso credenciales incorrectas 5 veces seguidas
    Cuando se supera el límite de intentos
    Entonces el sistema bloquea temporalmente el acceso por 15 minutos
