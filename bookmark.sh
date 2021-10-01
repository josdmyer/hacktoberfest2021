#!/usr/bin/env bash

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>newbookmark.log 2>&1

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Get a copy of bookmarks in xml format and save it on the Desktop
plutil -convert xml1 -o ~/Desktop/SafariBookmarks.xml ~/Library/Safari/Bookmarks.plist

# Create new temp file that has the title and url only in plain format and store it in a file called temp on the Desktop
grep -A1 -E '(>URLString<|>title<)' /Users/"$USER"/Desktop/SafariBookmarks.xml |grep -v -E '(>URLString|>title|^--)' | cut -d\> -f2 | cut -d\< -f1  >> /Users/"$USER"/Desktop/temp

mysql  < /Users/"$USER"/.Scripts/Bookmark-db/sql.sql

# Clean Up
rm /Users/"$USER"/Desktop/SafariBookmarks.xml || true
rm /Users/"$USER"/Desktop/temp || true

exit 0
