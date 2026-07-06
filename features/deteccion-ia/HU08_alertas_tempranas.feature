# language: es
# Epic EP-03 · Historia HU-08 · Recibir alertas tempranas
Característica: Alertas tempranas por tendencia negativa sostenida
  Como estudiante universitario
  Quiero recibir una alerta cuando el sistema detecte una tendencia negativa sostenida
  Para tomar acciones preventivas antes de llegar a una crisis

  Esquema del escenario: Alerta por ánimo bajo sostenido (normal)
    Dado que mi estado de ánimo se mantuvo en nivel "<nivel>" durante "<dias>" días consecutivos
    Cuando el motor de análisis evalúa mis registros
    Entonces el sistema me envía una alerta temprana
    Y la acompaña de una recomendación de autocuidado

    Ejemplos:
      | nivel | dias |
      | 1     | 3    |
      | 2     | 3    |
      | 1     | 4    |
      | 2     | 5    |

  Esquema del escenario: No reincidir tras la recuperación del ánimo (alterno)
    Dado que recibí una alerta y mi ánimo se recuperó a nivel "<nivel_recuperacion>" durante "<dias_recuperacion>" días consecutivos
    Cuando el motor reevalúa mis registros
    Entonces el sistema no genera nuevas alertas por el mismo episodio

    Ejemplos:
      | nivel_recuperacion | dias_recuperacion |
      | 3                  | 2                  |
      | 4                  | 2                  |

  Esquema del escenario: Clasificación del nivel de riesgo de la alerta (excepcional)
    Dado un patrón de registros "<patron>"
    Cuando el motor de alertas lo evalúa
    Entonces el sistema genera una alerta de tipo "<tipo>"
    Y "<derivacion>" el enlace de derivación a Bienestar (HU-12)

    Ejemplos:
      | patron                   | tipo           | derivacion |
      | ánimo <= 2 por 3 días    | temprana       | no incluye |
      | ánimo <= 2 por 7 días    | riesgo elevado | incluye    |
      | síntoma severo sostenido | riesgo elevado | incluye    |
      | ánimo <= 2 por 10 días   | riesgo elevado | incluye    |
