library(purrr)
library(readr)
library(dplyr)
library(tidyverse)
library(googlesheets4)

read_files <- function(path = "data/raw") {
  # Get the list of files
  files <- list.files(path = path, pattern = "*.csv", full.names = TRUE)
  
  # Initialize an empty list to store data frames
  data_list <- list()
  
  # Read and process each file, then remove unnecessary objects to save memory
  for (file in files) {
    # Read the file
    temp_data <- read_delim(file, delim = "|" ,col_types = cols(.default = col_character()))
    
    # Filter or process the data if needed
    temp_data <- temp_data %>% filter(str_detect(VPRIDIAGCIE_ATE, "O04"))
    
    # Add the processed data to the list
    data_list[[length(data_list) + 1]] <- temp_data
    
    # Remove temporary variables to free memory
    rm(temp_data)
    gc()
  }
  
  # Combine the list of data frames into a single data frame
  data <- bind_rows(data_list) %>% as_tibble()
  
  # Return the data
  return(data)
}



ubigeo_equivalencias <- read_sheet(
    "https://docs.google.com/spreadsheets/d/14PviM_Dlm8ZvGLqIi1tb685eehHezasWnZEnJdsz8lw/edit#gid=1430000038",
    "2021"
)


# create a function to read a list of csv files and convert them into a tibble. The columns are separated with the character "|", should use read_delim() instead of read_csv(). Also convert them to string. Also should be eficiente to not reach memory limit of 8gb

# read_files <- function(path = "data/raw") {
#     # get the list of files
#     files <- list.files(path = path, pattern = "*.csv", full.names = TRUE)
#     # read the files
#     data <- map_dfr(files, read_delim, delim = "|", col_types = cols(.default = col_character()))
#     # return the data
#     tibble_data <- as_tibble(data)    
#     return(tibble_data)
# }

# read the files
data_susalud <- read_files()