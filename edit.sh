#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "Usage: edit.sh [song folder]"
else
	echo "Opening Lilypond files for '$1'"
	find "$1" -name "*.ly" -exec open '{}' \;
fi