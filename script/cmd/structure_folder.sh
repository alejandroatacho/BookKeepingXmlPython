#!/bin/bash

# Path to the directory to be displayed
path="./"

# Name of the file to save the output to
file="folder_structure.txt"

# Delete the file if it already exists
if [ -f $file ]; then
  rm $file
fi

# Create the file and write the header

cd ..
cd ..
touch $file
echo "Folder structure of $path" >> $file
echo "=========================" >> $file

# Recursively list the files and folders and write them to the file
function list_files {
  for item in $1/*; do
    echo "$item" >> $file
    if [ -d $item ]; then
      echo "|-- $(basename $item)/" >> $file
      list_files $item
    else
      echo "|-- $(basename $item)" >> $file
    fi
  done
}

# Call the function with the specified path
list_files $path
mv file
# Print the message to confirm that the file has been created
echo "Folder structure printed to $file"
# rest my programm :3
sleep 1

# The source file path
source_file="./folder_structure.txt"

# The destination file path
destination_folder="./data"

# Check if the destination folder exists, create it if not
if [ ! -d $destination_folder ]; then
  mkdir -p $destination_folder
fi

# Move the file from the source to the destination folder
mv $source_file $destination_folder

# Confirm that the file has been moved
echo "File $source_file has been moved to $destination_folder"