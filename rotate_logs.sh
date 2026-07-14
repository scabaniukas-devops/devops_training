!/bin/bash

for file in app_*.log
do
	if [ -s "$file" ]; then

		mv "$file" "$file.old"

		touch "$file"

		echo " File $file have logs ... Geting archive ..."
	else
		echo "The File $file is empty"
	fi
done 
