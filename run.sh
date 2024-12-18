#!/bin/bash

# Find the most recently modified .asm file in the directory and its subdirectories
latest_asm_file=$(find . -name "*.asm" -type f -printf '%T@ %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)

# Check if an Assembly file exists
if [ -z "$latest_asm_file" ]; then
  echo "No Assembly files found in the current directory or subdirectories."
  exit 1
fi

echo "Assembling and running the Assembly file: $latest_asm_file"
echo " "

# Extract the filename without the extension
filename_no_ext=$(basename "$latest_asm_file" .asm)

# Assemble the Assembly program
nasm -f elf64 -o "$filename_no_ext.o" "$latest_asm_file"
assemble_status=$?

# Check if assembling was successful
if [ $assemble_status -ne 0 ]; then
  echo "Assembling failed. Please check your code for errors."
  exit 1
fi

# Link the object file to create an executable
ld -o "$filename_no_ext" "$filename_no_ext.o"
link_status=$?


./"$filename_no_ext"