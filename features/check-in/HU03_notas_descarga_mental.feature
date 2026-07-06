# language: es
# Epic EP-01 · Historia HU-03 · Notas rápidas / descarga mental
Característica: Notas rápidas / descarga mental
  Como estudiante universitario
  Quiero anotar pensamientos o pendientes asociados a mi check-in
  Para externalizar la rumiación y despejar la mente

  Esquema del escenario: Guardar una nota dentro del límite permitido (normal)
    Dado que terminé los campos del check-in
    Cuando escribo una nota de "<longitud>" caracteres y guardo
    Entonces el sistema almacena la nota vinculada al registro del día

    Ejemplos:
      | longitud |
      | 1        |
      | 120      |
      | 250      |
      | 400      |
      | 500      |

  Esquema del escenario: Check-in con nota vacía o solo espacios (alterno)
    Dado que dejo el campo de nota como "<contenido>"
    Cuando guardo el check-in
    Entonces el sistema registra el check-in correctamente sin exigir la nota

    Ejemplos:
      | contenido |
      |           |
      | "   "     |

  Esquema del escenario: Nota que supera el máximo de caracteres (excepcional)
    Dado que estoy escribiendo la nota del check-in
    Cuando intento ingresar "<longitud>" caracteres
    Entonces el sistema "<resultado>" e indica el máximo permitido

    Ejemplos:
      | longitud | resultado |
      | 501      | rechaza   |
      | 700      | rechaza   |
      | 1000     | rechaza   |
