

# checking out Tobii 

tobii_22001 <- read_xlsx("\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary")
qwerty <- tobii_22001

# Creating a for loop
data_dir <- "\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary"
data_files <- list.files(data_dir)
dfs <- list()
for (f in data_files) {
  df <- read_xlsx(file.path(data_dir, f))
  print(f)
  list.append(dfs, df)
}

# List of column numbers in Tobii datasets
ls(tobii_22001)

#[33] "Manually mapped gaze point X [22001_childPOV_speech]"    
#[34] "Manually mapped gaze point Y [22001_childPOV_speech]" 
#[39] "Mapped gaze point X [22001_childPOV_speech]"             
#[40] "Mapped gaze point Y [22001_childPOV_speech]"  
#[41] "Participant name" 


# Renaming column - working 
tobii_22001 <- rename(tobii_22001, 
                      manual_map_x = `Manually mapped gaze point X [22001_childPOV_speech]`) # Manually mapped X
tobii_22001 <- rename(tobii_22001, 
                      manual_map_y = `Manually mapped gaze point Y [22001_childPOV_speech]`) # Manually mapped Y
tobii_22001 <- rename(tobii_22001, 
                      gaze_point_map_x = `Mapped gaze point X [22001_childPOV_speech]`) # Mapped gaze point X 
tobii_22001 <- rename(tobii_22001, 
                      gaze_point_map_y = `Mapped gaze point Y [22001_childPOV_speech]`) # Mapped gaze point Y

# Indexing x 
idx <- grep("Manually mapped gaze point X", colnames(tobii_22001))
assert("Column not found that matches pattern", idx != 0)
tobii_22001$manual_map_x <- tobii_22001[idx]

# Summing all rows with values - working 
man_map_x_count = sum(!is.na(tobii_22001$manual_map_x)) # Manually mapped X
man_map_y_count = sum(!is.na(tobii_22001$manual_map_y)) # Manually mapped Y
gaze_point_x_count = sum(!is.na(tobii_22001$gaze_point_map_x)) # Manually mapped X
gaze_point_y_count = sum(!is.na(tobii_22001$gaze_point_map_y)) # Manually mapped Y

tobii <- tobii_22001 %>%
  tobii$man_map_x_count = sum(!is.na(tobii_22001$manual_map_x))
