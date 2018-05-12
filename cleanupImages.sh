#!/bin/bash
# Convert filenames to lowercase
# replace characters recursively
# and reformat to jpg with maxWidth of 1128
#####################################

find "./assets" -type f -depth -name '*' | while read file ; do
  directory=$(dirname "$file")
  oldfilename=$(basename "$file")
  newfilename=$(echo "$oldfilename" | tr ' ' '-' | tr '&' '-' | tr '_' '-' | sed 's/_-_/-/g')
  newfilename="${newfilename//.png/.jpg}"
  if [ "$oldfilename" != ".DS_Store" ]; then
    sips --resampleWidth 1128 -s format jpeg "$directory/$oldfilename" --out "$directory/$newfilename"
    if [ "$oldfilename" != "$newfilename" ]; then
      rm -f "$directory/$oldfilename"
      echo "rm $directory/$oldfilename"
    fi
  fi
done
exit 0