# language: es
# Epic EP-01 · Historia HU-02 · Registrar síntomas físicos
Característica: Registrar síntomas físicos asociados
  Como estudiante universitario
  Quiero registrar síntomas físicos asociados (sueño, cefalea, energía, apetito)
  Para que el seguimiento refleje señales tempranas más allá del ánimo

  Escenario: Registro de síntomas con intensidad (normal)
    Dado que estoy en el check-in
    Cuando selecciono los siguientes síntomas con su intensidad
      | sintoma          | intensidad |
      | calidad de sueño | 2          |
      | cefalea          | 4          |
      | energía          | 2          |
    Entonces el sistema asocia los síntomas y su intensidad al registro del día

  Esquema del escenario: Check-in con distinta cantidad de síntomas seleccionados (alterno)
    Dado que selecciono "<cantidad_sintomas>" síntoma(s) del catálogo
    Cuando guardo el check-in
    Entonces el sistema registra el check-in "<resultado>"

    Ejemplos:
      | cantidad_sintomas | resultado                               |
      | 0                 | sin marcar síntomas y sin mostrar error  |
      | 1                 | con el síntoma asociado                 |
      | 4                 | con los cuatro síntomas asociados       |

  Esquema del escenario: Síntoma severo sostenido genera señal de riesgo (excepcional)
    Dado que registré "<sintoma>" con intensidad "<intensidad>" durante "<dias_consecutivos>" días consecutivos
    Cuando guardo el check-in de hoy
    Entonces el sistema "<resultado>" el registro como "señal de riesgo"

    Ejemplos:
      | sintoma | intensidad | dias_consecutivos | resultado |
      | cefalea | 4          | 3                  | marca     |
      | apetito | 5          | 3                  | marca     |
      | energía | 2          | 3                  | no marca  |
