#!/bin/bash


engrave_part()
{
	song="$1"
	part=$2
	should_engrave_part=false
	if [ -f "$song/Parts/PDF/part_$part.pdf" ]
	then
		for file in "$song/"Parts/LY/"$(tr '[:lower:]' '[:upper:]' <<< ${part:0:1})${part:1}"/*
		do
			if [ "$file" -nt "$song/Parts/PDF/part_$part.pdf" ]
			then
				should_engrave_part=true
			fi
		done
		if [ "$song/Parts/LY/part_$part.ly" -nt "$song/Parts/PDF/part_$part.pdf" ]
		then
			should_engrave_part=true
		fi
	else
		should_engrave_part=true
	fi

	if [ -f "$song/Parts/LY/part_$part.ly" ]
	then
		if $should_engrave_part
		then
			echo "Engraving $part part..."
			lilypond -s "$song/Parts/LY/part_$part.ly" &&
				mv "part_$part.pdf" "$song/Parts/PDF/" &&
				mv "part_$part.midi" "$song/Parts/MIDI/part_$part.mid"
		else
			echo "$(tr '[:lower:]' '[:upper:]' <<< ${part:0:1})${part:1} part unmodified, skipping"
		fi
	else
		echo "No $part part found, skipping..."
	fi
}


engrave_score()
{
	song="$1"
	should_engrave_score=false
	for file in "$song/"Parts/PDF/*
			do
				if [ "$file" -nt "$song/Score/PDF/score.pdf" ]
				then
					should_engrave_score=true
				fi
			done

	if [ -f "$song/Score/LY/score.ly" ]
	then
		if ! $should_engrave_score 
		then
			echo "Score unmodified, skipping"
		else
			echo "Engraving score..."
			lilypond -s "$song/Score/LY/score.ly" &&
				mv "score.pdf" "$song/Score/PDF/"
				if [ -f "score.midi" ]
				then
					mv "score.midi" "$song/Score/MIDI/score.mid"
				fi
				if [[ -f "$song/Score/PDF/score.pdf" && -f "$song/Print/TEX/print.tex" ]]
				then
					echo "Typesetting score for printing..."
					cd "$song/Print/TEX/" &&
						pdflatex -interaction=batchmode "print.tex" >/dev/null &&
						mv "print.pdf" "../PDF/"
						rm "print.aux" "print.log"
						cd "../../"
				fi
			fi
	else
		echo "No score found, skipping..."
	fi
}

generate_thumbnails()
{
	song="$1"
	cd "$song/Print/PDF/" &&
		if [ -d pages ]; then
			rm -r pages/
		fi
		mkdir pages &&
		pdftk print.pdf burst output pages/page-%02d.pdf &&
		cd pages &&
		for file in *.pdf; do
			filename=${file%.pdf}
			convert -density 600x600 "$file" -flatten "$filename.png" &&
				convert -resize 33% "$filename.png" "$filename.png"
		done &&
		imageOptim -a -d . &&
		mv *.png ../PNG/ &&
		cd .. && rm -r pages/
}