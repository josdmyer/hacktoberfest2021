#! /bin/bash

 # --------------------------------------------------------------------------
 # Name: 		x
 # File Name: 	file.sh
 # Date:		Oct 1, 2021
 # Description: This bash script purpose is to hide and un-hide a folder based 
 #				on the conditions of the folder and if the user inputs the
 #				correct password or not also has the option to open the folder
 # --------------------------------------------------------------------------

   DIR="/Users/x/Downloads/Pictures/untitled"
   DIR2="/Users/x/Downloads/Pictures/.untitled"
   password="U2FsdGVkX18vy4f4QRB3qnb5vIWR0x+tlZmdAmPxX8Y="
   input=""
   result=""

   action()
   {
   	printf ": "
   	read -s input
   	result=$(echo "$password"| openssl enc -aes-128-cbc -a -d -salt -pass pass:wtf)

   	if [ "$result" = "$input" ]
   	then
   		clear
   		mv "$DIR2" "$DIR"
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
   				open $DIR
   			elif [[ "$1" == "-"* ]]
   			then
   				mv "$DIR" "$DIR2"
   			fi	
   		fi
   	fi
   }

   #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Main ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   opendir "$@"
   clear
   #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End of File ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
