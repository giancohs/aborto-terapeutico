library(tidyverse)



# create a function to read a list of csv files and convert them into a tibble. The columns are separated with the character "|", should use read_delim() instead of read_csv(). Also convert them to string.

read_files <- function(path = "data/raw") {
    # get the list of files
    files <- list.files(path = path, pattern = "*.csv", full.names = TRUE)
    # read the files
    data <- map_dfr(files, read_delim, delim = "|", col_types = cols(.default = col_character()))
    # return the data
    return(data)
}

# read the files
data <- read_files()