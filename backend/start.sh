#!/bin/bash


echo "Checking permissions for /usr/script..."
ls -lda /usr/script

echo "installing dos2unix..."
apt-get install dos2unix

echo "Script contents:"
cat -v $MY_SCRIPT_FILE_PATH

echo "Removing carriage returns from script file..."
dos2unix $MY_SCRIPT_FILE_PATH

# run the script
bash $MY_SCRIPT_FILE_PATH

