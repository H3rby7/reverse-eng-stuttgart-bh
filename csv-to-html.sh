#!/bin/bash

if [ $# -lt 2 ]; then
	echo "usage: $0 <input-file> <output>"
	echo "Takes a '.csv' file with columns 'rank id link title' and turns into an html"
	exit 1
fi

input=$1
output=$2

inputNoQuotes=`tr -d '"' < $input`

echo "<div>" > $output

while IFS=", " read -r rank id link titel
do
  echo "<a href='$link' target="_new">$rank | $id</a><br/>" >> $output
done <<< $inputNoQuotes

echo "</div>" >> $output
