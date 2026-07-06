# language: es
# Historia no funcional HU-NF05 · Privacidad y protección de datos (Ley N° 29733)
Característica: Privacidad y protección de datos
  Como estudiante universitario
  Quiero que mis datos emocionales estén protegidos conforme a la Ley N° 29733
  Para confiar en la app

  Escenario: Cifrado de datos en reposo y en tránsito (normal)
    Dado que registro información emocional en la app
    Cuando los datos se almacenan y se transmiten
    Entonces el sistema aplica cifrado AES-256 en reposo y TLS 1.2 o superior en tránsito

  Escenario: k-anonimato en reportes institucionales (excepcional)
    Dado un grupo (facultad o carrera) con menos de 5 estudiantes con registros
    Cuando se genera un reporte agregado para Bienestar
    Entonces el sistema oculta el dato aplicando k-anonimato con k >= 5
    Y muestra "datos insuficientes"
