#!/bin/bash



#Assignment 1 AmithRao writer.sh retry3

write_to_file() {
  # Check if both arguments are provided
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Error: Two arguments required."
    exit 1
  fi

  local writefile="$1"
  local writestr="$2"

  # Create the directory path if it doesn't exist
  local dirname=$(dirname "$writefile")
  mkdir -p "$dirname"

  # Write the content to the file
  echo "$writestr" > "$writefile"

  # Check if the file was created successfully
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to create the file."
    exit 1
  fi

  echo "File '$writefile' created successfully."
}

# Call the function with command-line arguments
write_to_file "$1" "$2"

