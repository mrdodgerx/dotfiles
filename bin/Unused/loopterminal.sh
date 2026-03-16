#!/bin/bash

#curpath=$(pwd)
curpath="/home/mrdodgerx/.config/bin"
#echo $($curpath)
for  file in "$curpath"/* 
do
	filename=$(basename $file)
	#echo $filename
	if  [ "$filename" != "starwars" ] && [ "$filename" != "randomterminal.sh" ]; then
		if [ ! -d "$file" ]; then
			$file
		fi
	fi
done
