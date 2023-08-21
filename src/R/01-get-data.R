
links_download_data <- c(
    #2021
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_1.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_2_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_3.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_4.csv",
    #2020
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2020_170621_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2020_170621_1_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2020_170621_2.csv",
    #2019
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2019_170621_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2019_170621_1.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2019_170621_2.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2019_170621_3.csv",
    #2018
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2018_170621_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2018_170621_1.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2018_170621_2.csv",
    "http://datos.susalud.gob.pe/sites/default/files/bd_IAFAS_atencion_Web_2018_170621_3.csv")

# increase time out download
options(timeout = 100000)

#create a function to download a list of files
download_files <- function(links_download_data, path = "data/raw") {
    #create the folder if it does not exist
    if (!dir.exists(path)) {
        dir.create(path)
    }
    #download the files
    for (i in 1:length(links_download_data)) {
        download.file(links_download_data[i], paste0(path, "/", basename(links_download_data[i])))
    }
}

#download the files
download_files(links_download_data)