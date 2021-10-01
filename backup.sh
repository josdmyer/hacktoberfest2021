#!/bin/bash

 # Local variables
 default_src=/Users/$USER/Downloads/files/
 default_dest=/Volumes/My\ Passport/files/

 usage()
 {
    echo "./backup              (backup default source to default destination)"
    echo "./backup -s path      (backup specific source to default destination)"
    echo "./backup -d path      (backup default source to specific destination)"
    echo "./backup    path path (backup specific source to specific destination)"
    press
    clear
 }

 # Function to prompt for key return until then wait
 press()
 {
 	read -r "Press [Enter] key to continue..."
 	clear
 }

 # Function to backup default source to default destination
 default()
 {
 	rsync -a --info=progress2 "$default_src/" "$default_dest/"
 }

 # Function to backup specific source to default destination
 src()
 {
 	rsync -a --info=progress2 "$2/" "$default_dest/"
 }

 # Function to backup default source to specific destination
 dest()
 {
 	rsync -a --info=progress2 "$default_src/" "$2/"
 }

 # Function to backup specific source to specific source
 src_dest()
 {
 	rsync -a --info=progress2 "$1/" "$2/"
 }

 # ------------------------------ Main ---------------------------------------
 clear
 if [ "$#" -eq 0 ]
 then
 	default
 elif [ "$#" -eq 2 ]
 then
 	if [ "$1" = "-s" ]
 	then
 		src "$@" 
 	elif [ "$1" = "-d" ]
 	then
 		dest "$@" 
 	elif [[ "$1" == "-"* ]]
 	then
 		usage
 	else
 		src_dest "$@" "$@"
 	fi
 else
 	usage
 fi
 # ------------------------------- End of File ------------------------------
