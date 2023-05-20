#Assignment1 - Amith Rao - finder.sh

count_occurrences() {
  # Check if directory argument is provided
  if [[ -z "$1" ]]; then
    echo "Error: Directory argument required."
    return 1
  fi

  # Check if string argument is provided
  if [[ -z "$2" ]]; then
    echo "Error: String argument required."
    return 1
  fi

  local directory="$1"
  local searchstr="$2"

  # Check if the directory exists
  if [[ ! -d "$directory" ]]; then
    echo "Error: Directory '$directory' not found."
    return 1
  fi

  # Count the number of files and matching lines
  local file_count=0
  local line_count=0

  while IFS= read -r -d '' file; do
    # Count the number of files
    ((file_count++))

    # Count the matching lines in the file
    local count=$(grep -c "$searchstr" "$file")
    ((line_count+=count))
  done < <(find "$directory" -type f -print0)

  echo "The number of files are $file_count and the number of matching lines are $line_count"
}

# Call the function with command-line arguments
count_occurrences "$1" "$2"

