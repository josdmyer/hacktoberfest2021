#! /bin/bash

   # --------------------------------------------------------------------------
   # Name:         x
   # Date:         Oct 1, 2021
   # File Name:    stats.sh
   # Descriptoin:  A bash script to give size of each format type in Books 
   #				directory to let me know how big my book directory is getting 
   # -------------------------------------------------------------------------
   #! /bin/bash

   files1=$(find /Users/x/Documents/Books/Books/ -type f -iname '*.epub' | wc -l)

   files2=$(find /Users/x/Documents/Books/Books/ -type f -iname '*.pdf' | wc -l)

   files3=$(find /Users/x/Documents/Books/Books/ -type f -iname '*.mobi' | wc -l)

   files4=$(find /Users/x/Documents/Books/Books/ -type f | wc -l)

   clear

   cd /Users/x/Documents/Books/Books/

   echo -n "Epub:  "
   find . -type f -iname '*.epub' -exec du -ch {} + | grep total$ 

   echo "Number of files:  $files1"
   echo

   echo -n "Pdf:  "
   find /Users/x/Documents/Books/Books/ -type f -iname '*.pdf' -exec du -ch {} + | grep total$

   echo "Number of files:  $files2"
   echo

   echo -n "Mobi:  "
   find /Users/x/Documents/Books/Books/ -type f -iname '*.mobi' -exec du -ch {} + | grep total$

   echo "Number of files:  $files3"
   echo

   echo -n "Total:  "
   du -sh /Users/x/Documents/Books/Books/

   echo "Number of files:  $files4"
   echo
   cd
   #--------------------------------- End of file --------------------------------
