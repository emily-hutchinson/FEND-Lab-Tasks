

# Packages
library(dplyr)
library(tidyverse)
library(testit)
library(rlist)
library(readxl)

stdize_col <- function(pattern, dataframe, new_col){
  col_idx <- grep(pattern, colnames(dataframe))
  assert("Column not found that matches pattern", col_idx != 0)
  return(dataframe[col_idx])
}

# Creating a for lop for 
example_data_file <- read_xlsx("\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary\\GIRLS 22017 T1D2 Child Data Export.xlsx")
ls(example_data_file)

data_dir <- "\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary"
data_files <- list.files(data_dir)
n_data_files <- 3
#n_data_files <- length(data_files)
dfs <- vector("list", n_data_files)

for (i in 1:n_data_files) {
  raw_df <- read_xlsx(file.path(data_dir, data_files[i]))
  raw_df$subject <- raw_df$`Participant name`
  raw_df$manual_map_x <- stdize_col("Manually mapped gaze point X", raw_df)
  raw_df$manual_map_y <- stdize_col("Manually mapped gaze point Y", raw_df)
  raw_df$gaze_final_x <- stdize_col("Mapped gaze point X", raw_df)
  raw_df$gaze_final_y <- stdize_col("Mapped gaze point Y", raw_df)

  print(paste(data_files[i], " ", i, "/", n_data_files))
  dfs[[i]] <- raw_df[, 
    c("subject", "manual_map_x", "manual_map_y", "gaze_final_x", "gaze_final_y")
  ]
}

combined_df <- bind_rows(dfs)
colnames(combined_df)
unique(combined_df$subject)

combin

group_by(combined_df, subject) %>% count()

group_by(combined_df, subject) %>% summarise_if(is.numeric)
group_by(combined_df, subject) %>% sum(!is.na(combined_df$manual_map_x))

agg_df <- group_by(combined_df, subject) %>% sum(!is.na(combined_df$manual_map_x))


t=

# Summing all rows with values - working 
man_map_x_count = sum(!is.na(combined_df$manual_map_x)) # Manually mapped X
man_map_y_count = sum(!is.na(tobii_22001$manual_map_y)) # Manually mapped Y
gaze_point_x_count = sum(!is.na(tobii_22001$gaze_point_map_x)) # Manually mapped X
gaze_point_y_count = sum(!is.na(tobii_22001$gaze_point_map_y)) # Manually mapped Y

tobii <- tobii_22001 %>%
  tobii$man_map_x_count = sum(!is.na(tobii_22001$manual_map_x))
