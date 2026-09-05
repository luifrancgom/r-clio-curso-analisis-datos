# Costo promedio de matrícula ----
(4389000 +
  4896000 +
  4135000 +
  4940000 +
  5638000 +
  4661000 +
  6238000) /
  7

# Vector atómico ----
costo_matricula <- c(
  4389000,
  4896000,
  4135000,
  4940000,
  5638000,
  4661000,
  6238000
)
costo_matricula

# Cálculo de la media muestral ----
media_costo_matricula <- mean(costo_matricula)
media_costo_matricula

# Cálculo de la varianza muestral ----
varianza_costo_matricula <- sum(
  (costo_matricula - media_costo_matricula)^2
) /
  (7 - 1)
varianza_costo_matricula

var(costo_matricula)

# Ejemplo advertencia ----
aumento_costo_matricula <- c(
  100000,
  130000,
  250000,
  145000,
  210000,
  94000
)

costo_matricula + aumento_costo_matricula

# Error ----
aumento_costo_matricula <- c(
  100000,
  130000,
  250000,
  145000,
  210000,
  94000,
  45000
)

costo_matricula + aumento_costo_matricula

# Tibbles ----
# Creación de tibbles ----
costo_matricula_pregrado <- tibble(
  ano = 2026,
  semestre = 1,
  codigo_snies = c(
    6527,
    108241,
    11428,
    11004,
    53703,
    105142 # adiciona una coma
    10963
  ),
  nombre_programa = c(
    "Administración de Empresas",
    "Administración de Riesgos, Seguridad y Salud en el Trabajo",
    "Contaduría Pública",
    "Ingeniería Civil",
    "Ingeniería Industrial",
    "Ingeniería Informática",
    "Relaciones Internacionales y Estudios Políticos"
  ),
  nivel_academico = "Pregrado",
  costo_matricula = costo_matricula
)

costo_matricula_pregrado
