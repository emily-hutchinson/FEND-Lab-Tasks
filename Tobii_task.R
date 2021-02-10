

# checking out Tobii 

tobii_22001 <- read_xlsx("\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary")
qwerty <- tobii_22001

# Creating a for
data_dir <- "\\\\psychodrama2.univ.pitt.edu\\Studies\\Girls Brain\\Tobii Glasses\\Raw Data\\T1 Speech Task Reexported for Mary"
data_files <- list.files(data_dir)
n_data_files <- length(data_files)
dfs <- vector("list", n_data_files)
for (i in 1:n_data_files) {
  df <- read_xlsx(file.path(data_dir, data_files[i]))
  col_idx <- grep("Manually mapped gaze point X", colnames(df))
  assert("Column not found that matches pattern", col_idx != 0)
  df$manual_map_x <- df[col_idx]
  print(data_files[i])
  dfs[[i]] <- df
}

# Indexing x 
idx <- grep("Manually mapped gaze point X", colnames(df))
assert("Column not found that matches pattern", idx != 0)
tobii_22001$manual_map_x <- tobii_22001[idx]

# Summing all rows with values - working 
man_map_x_count = sum(!is.na(tobii_22001$manual_map_x)) # Manually mapped X
man_map_y_count = sum(!is.na(tobii_22001$manual_map_y)) # Manually mapped Y
gaze_point_x_count = sum(!is.na(tobii_22001$gaze_point_map_x)) # Manually mapped X
gaze_point_y_count = sum(!is.na(tobii_22001$gaze_point_map_y)) # Manually mapped Y

tobii <- tobii_22001 %>%
  tobii$man_map_x_count = sum(!is.na(tobii_22001$manual_map_x))
