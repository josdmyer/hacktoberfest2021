#!/bin/bash

 # ----------------------------------------------------------------------------
 # Name:  		x
 # File Name:	bookmark.sh
 # Date:  	    Oct 1, 2021
 # Description:  A bash script to get a clean output of bookmarks with title 
 #				and url then clean up files once done
 # ---------------------------------------------------------------------------

 # Prompt for key return until then wait
 press()
 {
 	read -p "Press [Enter] key to continue..."
 	clear
 }

 # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Main ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 clear

 mv /Users/x/Documents/Safari\ Bookmarks.html /Users/x/Documents/Keep/Misc/Safari/sf.html

 perl -0ne 'print "$2\n$1\n" while (/a href=\"(.*?)\">(.*?)<\/a>/igs)' "/Users/x/Documents/Keep/Misc/Safari/sf.html" >> "/Users/x/Documents/Keep/Misc/Safari/temp"

 press

 rm /Users/x/Documents/Keep/Misc/Safari/temp
 rm /Users/x/Documents/Keep/Misc/Safari/sf.html

 # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End of File ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
