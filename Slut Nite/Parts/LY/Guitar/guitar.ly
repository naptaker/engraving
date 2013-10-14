\include "../../../../include/bend.ly"

\include "predefined-guitar-fretboards.ly"
\addChordShape #'powersurf #guitar-tuning #"1-1;3-3;3-4;2-2;x;x;"
\storePredefinedDiagram #default-fret-table
                        \chordmode { bes }
                        #guitar-tuning
                        #'((barre 6 3 6)
                        	 (place-fret 6 6)
													 (place-fret 5 8)
													 (place-fret 4 8)
													 (place-fret 3 7)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { a }
                        #guitar-tuning
                        #'((barre 6 3 5)
                        	 (place-fret 6 5)
													 (place-fret 5 7)
													 (place-fret 4 7)
													 (place-fret 3 6)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { g }
                        #guitar-tuning
                        #'((barre 6 3 3)
                        	 (place-fret 6 3)
													 (place-fret 5 5)
													 (place-fret 4 5)
													 (place-fret 3 4)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { des }
                        #guitar-tuning
                        #'((barre 6 3 9)
                        	 (place-fret 6 9)
													 (place-fret 5 11)
													 (place-fret 4 11)
													 (place-fret 3 10)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { aes }
                        #guitar-tuning
                        #'((barre 6 3 4)
                        	 (place-fret 6 4)
													 (place-fret 5 6)
													 (place-fret 4 6)
													 (place-fret 3 5)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { f }
                        #guitar-tuning
                        #'((barre 6 3 1)
                        	 (place-fret 6 1)
													 (place-fret 5 3)
													 (place-fret 4 3)
													 (place-fret 3 2)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { d }
                        #guitar-tuning
                        #'((barre 6 3 10)
                        	 (place-fret 6 10)
													 (place-fret 5 12)
													 (place-fret 4 12)
													 (place-fret 3 11)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { ees }
                        #guitar-tuning
                        #'((barre 6 3 11)
                        	 (place-fret 6 11)
													 (place-fret 5 13)
													 (place-fret 4 13)
													 (place-fret 3 12)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { c }
                        #guitar-tuning
                        #'((barre 6 3 8)
                        	 (place-fret 6 8)
													 (place-fret 5 10)
													 (place-fret 4 10)
													 (place-fret 3 9)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { ces }
                        #guitar-tuning
                        #'((barre 6 3 5)
                        	 (place-fret 6 7)
													 (place-fret 5 9)
													 (place-fret 4 9)
													 (place-fret 3 8)
													 (mute 2)
													 (mute 1))
\storePredefinedDiagram #default-fret-table
                        \chordmode { e }
                        #guitar-tuning
                        #'((open 6)
													 (place-fret 5 2)
													 (place-fret 4 2)
													 (place-fret 3 1)
													 (mute 2)
													 (mute 1))

gtrHarmony = \chordmode {
	\override FretBoards.FretBoard #'size = #'1.2

}

gtr = \relative c {
	\Key
	
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 2
	d4 <d a' d fis a d>8 [ a8 ] bes8 <bes f' bes d f bes>4 cis8 | % 3
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 4
	d4 <d a' d fis a d>8 [ a8 ] bes8 <bes f' bes d f bes>4 cis8 | % 5
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 6
	d4 <d a' d fis a d>8 [ a8 ] bes8 <bes f' bes d f bes>4 cis8 | % 7
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 8
	d4 <d a' d fis a d>8 [ a8 ] bes8 [ <bes f' bes d f bes>8 <a e' a cis e a>8 <as es' as c es as>8 ] | % 9
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | \barNumberCheck #10
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] bes'8 [ <bes f' bes d f
	bes>8 <a e' a cis e a>8 <as es' as c es as>8 ] | % 11
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | % 12
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] <bes' f' bes d f bes>8. [
	<a e' a cis e a>8. <as es' as c es as>8 ] | % 13
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | % 14
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] bes'8 [ <bes f' bes d f
	bes>8 <a e' a cis e a>8 <as es' as c es as>8 ] | % 15
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | % 16
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] <bes' f' bes d f bes>8. [
	<c g' c e g c>8. <cis gis' cis eis gis c>8 ] | % 17
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 18
	d4 <d a' d fis a d>8 [ a8 ] bes8 <bes f' bes d f bes>4 cis8 | % 19
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 |
	\barNumberCheck #20
	d4 <d a' d fis a d>8 [ a8 ] bes8 <bes f' bes d f bes>4 cis8 | % 21
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 22
	d4 <d a' d fis a d>8 [ a8 ] bes8 <bes f' bes d f bes>4 cis8 | % 23
	d4 <d a' d fis a d>8 [ cis8 ] d8 <d a' d fis a d>4 c8 | % 24
	d4 <d a' d fis a d>8 [ a8 ] bes8 [ <bes f' bes d f bes>8 <a e' a cis e a>8 <as es' as c es as>8 ] | % 25
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c
	f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | % 26
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] bes'8 [ <bes f' bes d f
	bes>8 <a e' a cis e a>8 <as es' as c es as>8 ] | % 27
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c
	f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | % 28
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] <bes' f' bes d f bes>8. [
	<a e' a cis e a>8. <as es' as c es as>8 ] | % 29
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c
	f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~ | \barNumberCheck #30
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] bes'8 [ <bes f' bes d f
	bes>8 <a e' a cis e a>8 <as es' as c es as>8 ] | % 31
	g4 <g d' g b d g>8 [ e8 ] bes'8 [ <bes f' bes d f bes>8 <f c' f a c
	f>8 <g d' g b d g>8 ~ ] ~ ~ ~ ~ ~  | % 32
	<g d' g b d g>8 [ g8 <g d' g b d g>8 e8 ] <bes' f' bes d f bes>8. [
	<c g' c e g c>8. <cis gis' cis eis gis c>8 ] | % 33
	<d a' d fis a d>1 ~ ~ ~ ~ ~ ~ | % 34
	<d a' d fis a d>1 | % 35
	<d a' d fis a d>8 [ <d a' d fis a d>16 <cis gis' cis eis gis cis>16
	] <c g' c e g c>8. [ <a e' a cis e a>8 <as es' as c es as>8 <g d' g
	b d g>8 <f c' f a c f>8. ] | % 36
	<d' a' d fis a d>8 [ <d a' d fis a d>16 <cis gis' cis eis gis cis>16
	] <c g' c e g c>8. [ <a e' a cis e a>8 <f c' f a c f>8 <g d' g b d
	g>8 <as es' as c es as>8 <a e' a cis e a>16 ] | % 37
	<d a' d fis a d>8 [ <d a' d fis a d>16 <cis gis' cis eis gis cis>16
	] <c g' c e g c>8. [ <a e' a cis e a>8 <as es' as c es as>8 <g d' g
	b d g>8 <f c' f a c f>8. ] | % 38
	<d' a' d fis a d>8 [ <d a' d fis a d>16 <d a' d fis a d>16 ] <c g' c
	e g b>16 [ <cis gis' cis eis gis bis>8 <d a' d fis a d>8 <f c' f
	a cis e>16 <c g' c e g c>16 <cis gis' cis eis gis cis>16 ] <d a'
	d fis a cis>4 \bar "|."
}


%showLastLength = R1*10

Guitar = {
	\set Staff.midiInstrument = #"electric guitar (clean)"
	\global \clef "treble_8" << \gtr >>
}
