
links_download_data <- c(
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_1.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_2_0.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_3.csv",
    "http://datos.susalud.gob.pe/sites/default/files/BD_atenciones_tedef_2021_4.csv")

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