# Load packages ----
library(tidyverse)
library(janitor)

# Import data ----
enrolled <- read_csv(
  file = "raw-data/enrolled_2026-2.csv"
)

# Clean ----
enrolled <- enrolled |>
  clean_names() |>
  set_names(
    nm = c(
      "id",
      "sede",
      "facultad",
      "programa_academico"
    )
  ) |>
  mutate(
    facultad = str_to_title(facultad)
  ) |>
  mutate(
    facultad = case_when(
      facultad %in% c("Estudios A Distancia") ~ "Estudios a Distancia",
      facultad %in% c("Ingenieria") ~ "Ingeniería",
      facultad %in% c("Ciencias Básicas") ~ "Ciencias Básicas y Aplicadas",
      facultad %in% c("Medicina") ~ "Medicina y Ciencias de la Salud",
      .default = facultad
    )
  ) |>
  mutate(
    programa_academico = case_when(
      programa_academico %in%
        c("Administracion de Empresas") ~ "Administración de empresas",
      programa_academico %in%
        c(
          "CONTADURÍA PÚBLICA",
          "Contaduría publica"
        ) ~ "Contaduría Pública",
      programa_academico %in%
        c(
          "Matematicas",
          "Matemáticas"
        ) ~ "Departamento de Matemáticas",
      programa_academico %in%
        c(
          "Departamento de fisica",
          "Depto de Fisica",
          "Departamento de física"
        ) ~ "Departamento de Física",
      programa_academico %in%
        c(
          "INGENIERÍA CIVIL",
          "Ingenieria Civil"
        ) ~ "Ingeniería Civil",
      programa_academico %in%
        c("Mecatronica") ~ "Ingeniería Mecatrónica",
      programa_academico %in%
        c("Ingenieria biomédica") ~ "Ingenieria Biomédica",
      programa_academico %in% c("Matematicas") ~ "Matemáticas",
      programa_academico %in%
        c(
          "TECNOLOGIA ATENCION PREHOSPITALARIA"
        ) ~ "Tecnología Atención Prehospitalaria",
      .default = programa_academico
    )
  )

# Select ----
enrolled <- enrolled |>
  select(-programa_academico)

# Inspect ----
enrolled |>
  glimpse()

# Filter ----
enrolled |>
  filter(facultad == "Medicina y Ciencias de la Salud")

# Count ----
enrolled |>
  count(facultad)

enrolled |>
  count(sede)

# Export ----
enrolled |>
  write_csv(
    file = "data/enrolled-clean_2026-2.csv"
  )
