# language: es
# Epic EP-03 · Historia HU-09 · Recibir recomendaciones personalizadas
Característica: Recomendaciones personalizadas de autocuidado
  Como estudiante universitario
  Quiero recibir recomendaciones de autocuidado según mi estado registrado
  Para saber qué hacer sin pagar una consulta privada

  Esquema del escenario: Selección del tipo de recomendación según ánimo y estrés (normal)
    Dado que registro un estado de ánimo "<animo>" y un nivel de estrés "<estres>"
    Cuando finalizo el check-in
    Entonces el sistema muestra una recomendación de tipo "<tipo_recomendacion>"

    Ejemplos:
      | animo | estres | tipo_recomendacion      |
      | 2     | 5      | respiración              |
      | 2     | 2      | actividad física ligera  |
      | 4     | 5      | gestión del tiempo       |
      | 1     | 5      | derivación prioritaria   |

  Esquema del escenario: Evitar repetir la misma recomendación (alterno)
    Dado que ayer recibí la recomendación "<recomendacion_previa>"
    Cuando registro un estado similar al día siguiente
    Entonces el sistema evita repetir "<recomendacion_previa>" de forma inmediata
    Y ofrece la alternativa "<recomendacion_alternativa>"

    Ejemplos:
      | recomendacion_previa   | recomendacion_alternativa     |
      | respiración 4-7-8      | caminata de 10 minutos        |
      | journaling de gratitud | pausa activa de estiramiento  |
      | música relajante       | técnica de grounding 5-4-3-2-1|

  Esquema del escenario: Riesgo elevado prioriza la derivación (excepcional)
    Dado que el registro indica riesgo elevado por "<motivo>"
    Cuando finalizo el check-in
    Entonces el sistema prioriza mostrar la derivación a Bienestar por encima de la recomendación de autocuidado

    Ejemplos:
      | motivo                   |
      | ánimo <= 2 por 7 días    |
      | síntoma severo sostenido |
