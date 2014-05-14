#!/bin/bash
source "funcs.sh"

if [ "$#" -eq 0 ]; then
	echo "Usage: engrave.sh [song folder]"
else
	if [[ "$#" -gt 1 && "$2" == "--clean" ]]; then
		echo "Deleting PDFs..."
		find "$1" -name "*.pdf" -exec rm '{}' \; && ./engrave.sh "$1"
	elif [[ "$#" -ge 3 && "$#" -lt 5 && "$2" == "--part" ]]; then
		if [[ "$4" == "--clean" ]]; then
			echo "Deleting PDF..."
			find "$1/Parts" -name "part_$3.pdf" -exec rm '{}' \;
		fi
		echo "Engraving '$1' $3 part..."
		engrave_part "$1" "$3"
	else 
		echo "Engraving '$1'"
		engrave_part "$1" "guitar"
		engrave_part "$1" "bass"
		engrave_part "$1" "drums"
		engrave_part "$1" "vocals"
		engrave_score "$1"
		generate_thumbnails "$1"
	fi
fi