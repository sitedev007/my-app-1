#!/bin/bash

echo "Script contents:"
cat -v $MY_SCRIPT_FILE_PATH

echo "Removing carriage returns from script file..."
sed -i 's/\r$//' $MY_SCRIPT_FILE_PATH

# run the script
bash $MY_SCRIPT_FILE_PATH

