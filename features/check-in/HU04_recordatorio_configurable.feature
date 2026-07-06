# language: es
# Epic EP-01 · Historia HU-04 · Recordatorio configurable
Característica: Recordatorio diario configurable
  Como estudiante universitario
  Quiero configurar un recordatorio diario a la hora que elija
  Para no olvidar realizar mi check-in

  Esquema del escenario: Notificación cuando no se ha registrado el check-in (normal)
    Dado que configuré el recordatorio a las "<hora>"
    Y no he registrado mi check-in de hoy
    Cuando llega la hora configurada
    Entonces el sistema me envía una notificación push para recordármelo

    Ejemplos:
      | hora  |
      | 07:00 |
      | 13:30 |
      | 20:00 |
      | 23:45 |

  Esquema del escenario: Sin notificación si el check-in ya fue completado (alterno)
    Dado que ya completé mi check-in a las "<hora_registro>"
    Cuando llega la hora configurada "<hora_recordatorio>"
    Entonces el sistema no envía la notificación

    Ejemplos:
      | hora_registro | hora_recordatorio |
      | 09:00         | 20:00             |
      | 19:55         | 20:00             |

  Esquema del escenario: Formato de hora y recordatorio desactivado (excepcional)
    Dado que configuro el recordatorio a las "<hora>" con estado "<estado>"
    Cuando guardo la configuración o llega la hora
    Entonces el sistema "<resultado>"

    Ejemplos:
      | hora  | estado      | resultado                     |
      | 24:00 | activado    | rechaza el formato de hora    |
      | 9:5   | activado    | rechaza el formato de hora    |
      | 20:00 | desactivado | no envía ninguna notificación |
      | 07:00 | desactivado | no envía ninguna notificación |
