#!/bin/bash

# Create "myDirectory" in home folder
mkdir ~/myDirectory

# Create "secondDirectory" inside "myDirectory"
mkdir ~/myDirectory/secondDirectory

# Create "myNotePaper" inside "secondDirectory"
touch ~/myDirectory/secondDirectory/myNotePaper

# Copy "myNotePaper" to "myDirectory"
cp ~/myDirectory/secondDirectory/myNotePaper ~/myDirectory/

# Rename the copied file in "myDirectory" to "myOldNotePaper"
mv ~/myDirectory/myNotePaper ~/myDirectory/myOldNotePaper
