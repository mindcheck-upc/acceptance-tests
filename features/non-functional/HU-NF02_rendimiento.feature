# language: es
# Historia no funcional HU-NF02 · Rendimiento
Característica: Rendimiento de la aplicación
  Como estudiante universitario
  Quiero que la app responda con rapidez
  Para no perder el hábito por demoras

  Escenario: Respuesta al enviar el check-in (normal)
    Dado un dispositivo de gama media sobre red 4G
    Cuando envío el check-in
    Entonces el sistema responde en menos de 1 segundo

  Escenario: Inicio en frío de la aplicación (normal)
    Dado la app cerrada en un dispositivo de gama media sobre red 4G
    Cuando inicio la app desde cero
    Entonces la pantalla principal carga en menos de 3 segundos
