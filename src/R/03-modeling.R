library(tidyverse)

abortos_2021 <- data %>% 
    filter(str_detect(VPRIDIAGCIE_ATE, "O04"))  %>% 
    select(
        VFECPRES_ATE,
        VTDOCPAGO_FAC, 
        VTAFILPAC_ATE, 
        VTIPOCOBERT_ATE, 
        VPRIDIAGCIE_ATE,
        VFECINGRHOSP_ATE,
        VFECEGRHOSP_ATE,
        VUBIGEOAFILIA_ATE,
        VUBIGEOIPRESS_ATE)

# TO DO 
# Convert colnames and data to a more understandable format (replace codes with text)

