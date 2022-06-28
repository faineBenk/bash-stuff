#!/bin/bash
#https://linuxhint.com/read_file_line_by_line_bash/

file=$1
read "${file}"

function check_urls() { 
	while read -r url; do
		echo $url
		command=$(curl --connect-timeout 1200 -sL -w "%{http_code}\\n" $url -o /dev/null)
		if [ $command == "200" ]; then
              		echo "http response is:" $command
              		echo "SUCCESS"
        	elif [[ $command == "000" ]] || [[ $command == "500" ]] || [[ $command == "400" ]]; then
              		echo "FAILURE" $command
              		exit 1
        	else 
              		echo "https response is:" $command
        	fi
	done < "$file"
}

check_urls 

