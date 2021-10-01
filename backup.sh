#!/bin/bash

  # ---------------------------------------------------------------------------
  # Name:			xuser
  # File Name:	backup.sh
  # Date:  		Oct 1, 2021
  # Description:  A bash script to backup files properly so they won't be
  #				corrupted so easily by just copying and pasting.  
  #			This script will handle many situations from default source and 
  #			destination to specific source or specific dest or both specific
  #				source and destination
  # ---------------------------------------------------------------------------

  # Local variables
  default_src=/Users/x/Downloads/files/
  default_dest=/Volumes/My\ Passport/files/

  # Function to prompt for key return until then wait
  press()
  {
  	read -p "Press [Enter] key to continue..."
  	clear
  }

  # Function to backup default source to default destination
  default()
  {
  	/Users/x/Downloads/Software/rsync-3.1.1/rsync -a --info=progress2 "$default_src/" "$default_dest/"
  }

  # Function to backup specific source to default destination
  src()
  {
  	/Users/x/Downloads/Software/rsync-3.1.1/rsync -a --info=progress2 "$2/" "$default_dest/"
  }

  # Function to backup default source to specific destination
  dest()
  {
  	/Users/x/Downloads/Software/rsync-3.1.1/rsync -a --info=progress2 "$default_src/" "$2/"
  }

  # Function to backup specific source to specific source
  src_dest()
  {
  	/Users/x/Downloads/Software/rsync-3.1.1/rsync -a --info=progress2 "$1/" "$2/"
  }

  usage()
  {
  	echo "./backup              (backup default source to default destination)"
  	echo "./backup -s path      (backup specific source to default destination)"
  	echo "./backup -d path      (backup default source to specific destination)"
  	echo "./backup    path path (backup specific source to specific destination)"
  	press
  	clear
  }

  # ------------------------------ Main -----------------------------------------
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
  # ------------------------------- End of File ---------------------------------
