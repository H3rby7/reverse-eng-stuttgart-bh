#!/bin/bash

if [ $# -lt 2 ]; then
	echo "usage: $0 <input-file> <output>"
	echo "Takes a '.csv' file with columns 'rank id link title' and turns into markdown"
	exit 1
fi

input=$1
output=$2

inputNoQuotes=`tr -d '"' < $input`

echo "# Direct Links" > $output

while IFS=", " read -r rank id link titel
do
  echo "1. [$id]($link)" >> $output
done <<< $inputNoQuotes
