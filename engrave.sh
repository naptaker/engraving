#!/bin/bash
source "funcs.sh"

if [ "$#" -eq 0 ]; then
	echo "Usage: engrave.sh [song folder]"
else
	if [[ "$#" -gt 1 && "$2" == "--clean" ]]; then
		echo "Deleting PDFs..."
		find "$1" -name "*.pdf" -exec rm '{}' \;
	fi
	echo "Engraving '$1'"
	engrave_part "$1" "guitar"
	engrave_part "$1" "bass"
	engrave_part "$1" "drums"
	engrave_part "$1" "vocals"
	engrave_score "$1"
fi