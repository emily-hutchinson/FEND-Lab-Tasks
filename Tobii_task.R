

# checking out Tobii 

tobii_22001 <- read_xlsx("C:\\Users\\emily\\Desktop\\GIRLS 22001 T1D2 Child Data Export.xlsx")

# List of column numbers in Tobii datasets
ls(tobii_22001)

#[33] "Manually mapped gaze point X [22001_childPOV_speech]"    
#[34] "Manually mapped gaze point Y [22001_childPOV_speech]" 
#[39] "Mapped gaze point X [22001_childPOV_speech]"             
#[40] "Mapped gaze point Y [22001_childPOV_speech]"  
#[41] "Participant name" 

names(tobii_22001)[33] <- "manual_map"
tobii_22001$manual_map
tobii_22001$`Manually mapped gaze point X [22001_childPOV_speech]`

# Renaming column - working 
tobii_22001 <- rename(tobii_22001, 
                      manual_map_x = `Manually mapped gaze point X [22001_childPOV_speech]`) # Manually mapped X
tobii_22001 <- rename(tobii_22001, 
                      manual_map_y = `Manually mapped gaze point Y [22001_childPOV_speech]`) # Manually mapped Y
tobii_22001 <- rename(tobii_22001, 
                      gaze_point_map_x = `Mapped gaze point X [22001_childPOV_speech]`) # Mapped gaze point X 
tobii_22001 <- rename(tobii_22001, 
                      gaze_point_map_y = `Mapped gaze point Y [22001_childPOV_speech]`) # Mapped gaze point Y

# Summing all rows with values - working 
man_map_x_count = sum(!is.na(tobii_22001$manual_map_x)) # Manually mapped X
man_map_y_count = sum(!is.na(tobii_22001$manual_map_y)) # Manually mapped Y
gaze_point_x_count = sum(!is.na(tobii_22001$gaze_point_map_x)) # Manually mapped X
gaze_point_y_count = sum(!is.na(tobii_22001$gaze_point_map_y)) # Manually mapped Y