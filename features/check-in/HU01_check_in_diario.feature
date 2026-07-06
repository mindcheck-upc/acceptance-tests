# language: es
# Epic EP-01 · Historia HU-01 · Registrar check-in diario
Característica: Registrar check-in emocional diario
  Como estudiante universitario
  Quiero registrar mi estado emocional diario en un formulario de un solo paso
  Para tomar conciencia de cómo me siento sin que me quite tiempo

  Antecedentes:
    Dado que soy un estudiante autenticado con correo institucional vigente

  Esquema del escenario: Registro exitoso del check-in del día (normal)
    Dado que aún no he registrado mi check-in de hoy
    Cuando completo el check-in con ánimo "<animo>", energía "<energia>", sueño "<sueno>" horas y estrés "<estres>"
    Entonces el sistema guarda el registro asociado a mi usuario con fecha y hora
    Y muestra el mensaje "<mensaje>"
    Y la operación se completa en menos de 2 minutos

    Ejemplos:
      | animo | energia | sueno | estres | mensaje                       |
      | 4     | 3       | 7     | 2      | Check-in registrado con éxito |
      | 1     | 1       | 4     | 5      | Check-in registrado con éxito |
      | 5     | 5       | 9     | 1      | Check-in registrado con éxito |
      | 3     | 2       | 6     | 3      | Check-in registrado con éxito |

  Esquema del escenario: Validación de los rangos de los campos del check-in
    Dado que estoy en el formulario de check-in
    Cuando ingreso ánimo "<animo>", energía "<energia>", sueño "<sueno>" y estrés "<estres>"
    Entonces el sistema "<resultado>" el registro

    Ejemplos:
      | animo | energia | sueno | estres | resultado |
      | 1     | 1       | 4     | 5      | acepta    |
      | 5     | 5       | 9     | 1      | acepta    |
      | 0     | 3       | 7     | 2      | rechaza   |
      | 3     | 6       | 7     | 2      | rechaza   |

  Esquema del escenario: Intento de segundo registro el mismo día (alterno)
    Dado que ya registré ánimo "<animo>", energía "<energia>", sueño "<sueno>" y estrés "<estres>" hoy a las "<hora_registro>"
    Cuando intento iniciar un nuevo check-in a las "<hora_intento>"
    Entonces el sistema muestra el registro existente con esos valores
    Y habilita el botón "Editar"
    Y no crea un segundo registro para la misma fecha

    Ejemplos:
      | animo | energia | sueno | estres | hora_registro | hora_intento |
      | 4     | 3       | 7     | 2      | 08:00         | 08:05        |
      | 2     | 2       | 5     | 4      | 09:15         | 23:59        |
      | 3     | 4       | 6     | 2      | 00:05         | 23:58        |

  Esquema del escenario: Registro sin conexión a internet (excepcional)
    Dado que no tengo conexión a internet durante "<minutos_sin_conexion>" minutos
    Cuando guardo el check-in con ánimo, energía, sueño, estrés, síntomas y nota
    Entonces el sistema lo almacena localmente con marca de tiempo
    Y lo marca como "Pendiente de sincronizar"
    Cuando recupero la conexión
    Entonces el sistema envía el registro al servidor automáticamente sin duplicar el del día
    Y el estado final es "<estado_final>"

    Ejemplos:
      | minutos_sin_conexion | estado_final |
      | 5                    | Sincronizado |
      | 60                   | Sincronizado |
      | 1440                 | Sincronizado |
