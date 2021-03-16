# Importing relevant package 
import os, shutil

# Indentifying base directory

base_dir = '/data/GBS_SID'

# For subdirectories in base directory (ie. T1 subjects folder in data/GBS_SID/)
for d in os.listdir(base_dir):

	# Identifying subdirectories from base directory via length 
	# (i.e. T1 subject id numbers)
	if len(d) == 5:

		# Identifying sub-subdirector (ie. repaired file folder in T1 subject folder)
		last_dir = '1_SID_' + d + '_repaired'   

		# Identifying full source path of base directory, subdirectory, sub-subdirectory
		# (eg. data/GBS_SID/22XXX/1_SID_22XXX_repaired/)
		source_path = base_dir + '/' + d + '/' + last_dir

		# Identifying new destination path (i.e. creating new folder containing repaired 
		# folders for each subject)
		dest_path = base_dir + '/repaired_files/' + last_dir

		# Contingency that source-path is a directory that exists AND the 
		# directory has not already been copied to the new destination path
		# (i.e. 1_SID_22XXX_repaired is a sub-subdirectory and has not been copied
		# to new folder)
		if os.path.isdir(source_path) and not os.path.isdir(dest_path):
			print(source_path, dest_path)

			# Copy files contined in full source path to new destination folder
			shutil.copytree(source_path, dest_path)
