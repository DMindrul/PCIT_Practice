yourName="MindrulDmytro"

max_number=0
for file in ${yourName}*
do
  if [[ $file =~ ${yourName}([0-9]+) ]]; then
    number="${BASH_REMATCH[1]}"
    if [ "$number" -gt "$max_number" ]; then
      max_number="$number"
    fi
  fi
done

for ((i = max_number + 1; i <= max_number + 25; i++))
do
  filename="${yourName}${i}"
  touch "$filename"
  echo "Created file: $filename"
done
