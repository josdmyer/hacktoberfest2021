#! /bin/bash

DIR="/Users/$USER/Downloads/Pictures/untitled"
DIR2="/Users/$USER/Downloads/Pictures/.untitled"
password="U2FsdGVkX18vy4f4QRB3qnb5vIWR0x+tlZmdAmPxX8Y="
input=""
result=""

action()
{
	printf ": "
	read -s -r input
	result=$(echo "$password"| openssl enc -aes-128-cbc -a -d -salt -pass pass:wtf)

	if [ "$result" = "$input" ]
	then
		clear
		open "$DIR2"
	fi
}

opendir()
{
	if [ -d "$DIR" ]
	then
		clear
		mv "$DIR" "$DIR2"
	elif [ -d "$DIR2" ]
	then
		if [ $# -eq 0 ]
		then
			action
		elif [ $# -eq 1 ]
		then
			if [ "$1" = "-o" ]
			then
				action
				open "$DIR"
			elif [[ "$1" == "-"* ]]
			then
				mv "$DIR" "$DIR2"
			fi	
		fi
	fi
}

opendir "$@"
clear
