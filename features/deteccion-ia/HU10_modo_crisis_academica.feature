# language: es
# Epic EP-03 · Historia HU-10 · Modo crisis académica
Característica: Modo crisis académica
  Como estudiante universitario
  Quiero activar un modo especial durante épocas de exámenes
  Para recibir técnicas de gestión del tiempo y del estrés en los momentos más exigentes

  Esquema del escenario: Activación del modo crisis según el calendario académico (normal)
    Dado que la fecha actual es "<fecha>" y el periodo de evaluaciones va de "<inicio>" a "<fin>"
    Cuando ingreso a la app
    Entonces el modo crisis académica queda "<estado>"
    Y prioriza recomendaciones de gestión del tiempo y mindfulness

    Ejemplos:
      | fecha      | inicio     | fin        | estado |
      | 2026-07-08 | 2026-07-08 | 2026-07-15 | activo |
      | 2026-07-10 | 2026-07-08 | 2026-07-15 | activo |
      | 2026-07-15 | 2026-07-08 | 2026-07-15 | activo |
      | 2026-11-30 | 2026-11-28 | 2026-12-05 | activo |

  Esquema del escenario: Desactivación automática al terminar el periodo (alterno)
    Dado que el periodo de evaluaciones finalizó el "<fin>"
    Cuando el sistema detecta la fecha actual "<fecha_actual>"
    Entonces desactiva automáticamente el modo crisis académica
    Y regresa a las recomendaciones estándar

    Ejemplos:
      | fin        | fecha_actual |
      | 2026-07-15 | 2026-07-16   |
      | 2026-07-15 | 2026-07-20   |
      | 2026-12-05 | 2026-12-06   |

  Esquema del escenario: Activación manual sin calendario cargado (excepcional)
    Dado que la universidad no cargó el calendario académico
    Cuando activo manualmente el modo crisis indicando la fecha de fin "<fecha_fin_manual>"
    Entonces el sistema mantiene el modo crisis activo hasta "<fecha_fin_manual>"

    Ejemplos:
      | fecha_fin_manual |
      | 2026-07-20       |
      | 2026-08-01       |
      | 2026-12-15       |
