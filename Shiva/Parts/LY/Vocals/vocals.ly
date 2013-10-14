voxVerseOne = \relative c' {
	\set Staff.midiInstrument = #"choir aahs"
	\global \clef bass \key fis \major
	
	R1*10
	
	cis4 ais4 r2 |
	r2 cis8 dis8 cis8 b8 |
	cis4 ais4 |
}

lyricsVerseOne = {
	\set stanza = #"1. "
	\lyricmode {
		Shi -- va,
		we don't real -- ly need ya.
	}
}
