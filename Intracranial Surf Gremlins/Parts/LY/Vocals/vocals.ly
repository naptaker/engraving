voxVerseOne = \relative c {
	\set Staff.midiInstrument = #"choir aahs"
	\global \clef bass \Key
	
	\stopStaff
	\override Staff.Clef #'stencil = ##f
	\skip 1*19
	\pageBreak
	\override Staff.Clef #'stencil = ##t
	\startStaff
	
	r4 f8 e f aes f e |
	f aes r4 r2 |
	r4 e8 f bes aes f aes | f4 r r2 |
	r8 f f bes, f'4. aes8 | bes aes4 f8 ~ f2 | \break
	r8 f f e f aes f e ~ |  e2 r2 |
	R1 | \stopStaff
	\skip 1*2 | \pageBreak
}

voxVerseTwo = \relative c' {
	\set Staff.midiInstrument = #"choir aahs"
	\global \clef bass \Key
	
	\stopStaff
	\override Staff.Clef #'stencil = ##f
	\skip 1*19
	\override Staff.Clef #'stencil = ##t
	\startStaff
	bes8 bes bes4 bes bes8 aes | des4. bes bes8 aes |
	bes4 aes des8 bes f aes | f2 r4 r8 aes |
	bes des4 bes bes8 bes aes | bes des r4 r2 |
	f,4 f f8 f f e | R1 | f4 r r2 | \stopStaff
	\skip 1*2 |
}

lyricsVerseOne = {
	\set stanza = #"1. "
	\lyricmode {
		On the edge of the hor -- i -- zon
		where the wa -- ters kiss the sky
		I want to ride the gold -- en waves __
		un -- til the day that I die
	}
}

lyricsVerseTwo = {
	\set stanza = #"2. "
	\lyricmode {
		Peo -- ple might think that I'm cra -- zy
		and I've lost my e -- ver -- lov -- in' mind
		but I don't care, I've got the o -- cean
		surf surf surf -- in' up my spine
	}
}

