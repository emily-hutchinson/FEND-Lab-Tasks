
# Packages
library(dplyr)
library(tidyverse)
library(testit)
library(rlist)
library(readxl)

stdize_col <- function(dataframe, pattern, new_col){
  
  # get the index of the column that matches pattern
  col_idx <- grep(pattern, colnames(dataframe))
  
  # check whether any column index was found
  assert("Column not found that matches pattern", col_idx != 0)
  
  # assign new_col name to the column at the found index
  colnames(dataframe)[col_idx] <- new_col
  
  # return the modified dataframe to keep the changes
  return(dataframe)
}

data_dir <- "\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary"
#data_dir <- "C:\\Users\\mtr22\\Code\\FEND-LAb-Tasks\\data"

example_data_file <- read_xlsx(file.path(data_dir, "22206 GIRLS T1D2 Child Data Export.xlsx"))
ls(example_data_file)

# list the data files in data directory
data_files <- list.files(data_dir)

# create empty list to accumulate data frames
#n_data_files <- 3
n_data_files <- length(data_files)
dfs <- vector("list", n_data_files)

# for each data file,
for (i in 1:n_data_files) {
  
  # read in the data file
  raw_df <- read_xlsx(file.path(data_dir, data_files[i]))
  
  # rename the needed columns to standardized names
  raw_df <- stdize_col(raw_df, "Participant name", "subject")
  raw_df <- stdize_col(raw_df, "Manually mapped gaze point X", "manual_map_x")
  raw_df <- stdize_col(raw_df, "Manually mapped gaze point Y", "manual_map_y")
  raw_df <- stdize_col(raw_df, "Mapped gaze point X", "gaze_final_x")
  raw_df <- stdize_col(raw_df, "Mapped gaze point Y", "gaze_final_y")

  # select only the standardized columns and put data frame in list
  dfs[[i]] <- raw_df[, c(
    "subject", "manual_map_x", "manual_map_y", "gaze_final_x", "gaze_final_y"
  )]
  
  # display the progress
  print(paste(data_files[i], " ", i, "/", n_data_files))
}

# combine all the data frames in list
combined_df <- bind_rows(dfs)

colnames(combined_df)
unique(combined_df$subject)
group_by(combined_df, subject) %>% count()

count_not_na <- function(x) {
  return(sum(!is.na(x)))
}

# count the total number of non-missing values in each column, per subject
agg_df <- group_by(combined_df, subject) %>% 
  summarise_if(is.numeric, count_not_na)

print(agg_df)

##### matt: this is where I left off ######

if (false) {
  # Summing all rows with values - working 
  man_map_x_count = sum(!is.na(combined_df$manual_map_x)) # Manually mapped X
  man_map_y_count = sum(!is.na(tobii_22001$manual_map_y)) # Manually mapped Y
  gaze_point_x_count = sum(!is.na(tobii_22001$gaze_point_map_x)) # Manually mapped X
  gaze_point_y_count = sum(!is.na(tobii_22001$gaze_point_map_y)) # Manually mapped Y
  
  tobii <- tobii_22001 %>%
    tobii$man_map_x_count = sum(!is.na(tobii_22001$manual_map_x))
}
