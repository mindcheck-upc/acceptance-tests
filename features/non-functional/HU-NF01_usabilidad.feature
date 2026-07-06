# language: es
# Historia no funcional HU-NF01 · Usabilidad del check-in
Característica: Usabilidad del check-in
  Como estudiante universitario
  Quiero que el check-in se complete en menos de 120 segundos y en no más de 3 toques
  Para usarlo sin que sea una carga

  Escenario: El check-in cumple el umbral de tiempo y toques (normal)
    Dado un usuario que realiza su check-in diario
    Cuando completa todo el flujo de registro
    Entonces el check-in se completa en 120 segundos o menos
    Y en no más de 3 toques

  Escenario: Flujo que excede el umbral de toques (excepcional)
    Dado un usuario que realiza su check-in diario
    Cuando el flujo requiere más de 3 toques para guardar
    Entonces la prueba de usabilidad se marca como no conforme con HU-NF01
