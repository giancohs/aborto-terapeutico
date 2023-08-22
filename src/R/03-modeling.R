library(tidyverse)
library(lubridate)

# Exporting filtered data from susalud

# data_susalud %>% 
#     write_csv("data/processed/abortos_compiled.csv")
    
# Reading data from susalud

data_susalud <- read_csv("data/processed/abortos_compiled.csv")

abortos <- data_susalud %>% 
    #filtering only abortions with diagnosis code O04
    select(
        fecha_presentacion = VFECPRES_ATE,
        tipo_afiliacion_cliente = VTAFILPAC_ATE, 
        tipo_cobertura = VTIPOCOBERT_ATE, 
        diagnostico_codigo = VPRIDIAGCIE_ATE,
        fecha_nacimiento_paciente = VFECNACPAC_ATE,
        fecha_ingreso_hospitalario = VFECINGRHOSP_ATE,
        fecha_egreso_hospitalario = VFECEGRHOSP_ATE,
        ubigeo_paciente = VUBIGEOAFILIA_ATE,
        ubigeo_ipress_inei = VUBIGEOIPRESS_ATE,)

# TO DO 
# Convert colnames and data to a more understandable format (replace codes with text)

abortos_clean <- abortos %>% 
    mutate(
        fecha_presentacion = ymd(fecha_presentacion),
        año_presentacion = year(fecha_presentacion),
        tipo_afiliacion_cliente = case_when(
            tipo_afiliacion_cliente == "1" ~ "Regular",
            tipo_afiliacion_cliente == "2" ~ "SCTR",
            tipo_afiliacion_cliente == "3" ~ "Potestativo",
            tipo_afiliacion_cliente == "4" ~ "SCTR Independiente",
            tipo_afiliacion_cliente == "5" ~ "Complementario",
            tipo_afiliacion_cliente == "6" ~ "SOAT"
        ),
        tipo_cobertura = case_when(
            tipo_cobertura == "0" ~ "No aplica",
            tipo_cobertura == "1" ~ "Extra hospitalario",
            tipo_cobertura == "2" ~ "Médico en planta",
            tipo_cobertura == "3" ~ "Medicinas alternativas ",
            tipo_cobertura == "4" ~ "Ambulatorio",
            tipo_cobertura == "5" ~ "Hospitalaria",
            tipo_cobertura == "6" ~ "Emergencia",
            tipo_cobertura == "7" ~ "Otros",          
        ),
        fecha_nacimiento_paciente = ymd(fecha_nacimiento_paciente),
        edad_paciente = year(fecha_presentacion) - year(fecha_nacimiento_paciente),        
        diagnostico = case_when(
            str_detect(diagnostico_codigo, "O04")  ~ "Aborto médico",
            T ~ diagnostico_codigo
        ),
        subdivision_diagnostico = case_when(
            diagnostico_codigo == "O04.0" ~ "Incompleto, complicado con infección genital y pelviana",
            diagnostico_codigo == "O04.1" ~ "Incompleto, complicado por hemorragia excesiva o tardía",
            diagnostico_codigo == "O04.2" ~ "Incompleto, complicado por embolia",
            diagnostico_codigo == "O04.3" ~ "Incompleto, con otras complicaciones especificadas y las no especificadas",
            diagnostico_codigo == "O04.4" ~ "Incompleto, sin complicación",
            diagnostico_codigo == "O04.5" ~ "Completo o no especificado, complicado con infección genital y pelviana",
            diagnostico_codigo == "O04.6" ~ "Completo o no especificado, complicado por hemorragia excesiva o tardía",
            diagnostico_codigo == "O04.7" ~ "Completo o no especificado, complicado por embolia",
            diagnostico_codigo == "O04.8" ~ "Completo o no especificado, con otras complicaciones especificadas y las no especificadas",
            diagnostico_codigo == "O04.9" ~ "Completo o no especificado, sin complicación",
            T ~ diagnostico_codigo
        ),
        fecha_ingreso_hospitalario = ymd(fecha_ingreso_hospitalario),
        año_ingreso_hospitalario = year(fecha_ingreso_hospitalario),
        fecha_egreso_hospitalario = ymd(fecha_egreso_hospitalario),
        dias_hospitalizacion = fecha_egreso_hospitalario - fecha_ingreso_hospitalario        
    ) %>% 
    left_join(
        ubigeo_equivalencias %>% 
        select(
            ubigeo_paciente = ubigeo_reniec,
            departamento_paciente = departamento,
            provincia_paciente = provincia,
            distrito_paciente = distrito_reniec,
        ),
        by = "ubigeo_paciente"
    ) %>%
    left_join(
        ubigeo_equivalencias %>% 
        select(
            ubigeo_ipress_inei = ubigeo_inei,
            departamento_ipress_inei = departamento,
            provincia_ipress_inei = provincia,
            distrito_ipress_inei = distrito_inei,
        ),
        by = "ubigeo_ipress_inei"
    )  %>% 
    select(
        fecha_presentacion,
        año_presentacion,
        tipo_afiliacion_cliente,
        tipo_cobertura,
        fecha_nacimiento_paciente,
        edad_paciente,
        diagnostico_codigo,
        diagnostico,
        subdivision_diagnostico,
        fecha_ingreso_hospitalario,
        año_ingreso_hospitalario,
        fecha_egreso_hospitalario,
        dias_hospitalizacion,
        ubigeo_paciente,
        departamento_paciente,
        provincia_paciente,
        distrito_paciente,
        ubigeo_ipress_inei,
        departamento_ipress_inei,
        provincia_ipress_inei,
        distrito_ipress_inei
    )

abortos_clean %>% 
    write_csv("data/processed/abortos_clean.csv")

