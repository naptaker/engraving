\version "2.16.2"

\header {
  title = "Jingle Fuzz"
  composer = "Music by E. Bailey"
  arranger = "Arr. by S. Albers, E. Bailey, P. Drum, and A. Smith"
}

global = {
  \key c \major
  \time 4/4
}

electricBass = \relative c, {
  \global
  % Music follows here.
  
}

jazzGuitar = \relative c' {
  \global
  % Music follows here.
  c d e f g
  
}

drum = \drummode {
  \global
  % Drums follow here.
  
}

tenorVoice = \relative c' {
  \global
  \dynamicUp
  % Music follows here.
  
}

verseTenorVoice = \lyricmode {
  % Lyrics follow here.
  Words
  
}

electricBassPart = \new Staff \with {
  midiInstrument = "electric bass (finger)"
  instrumentName = "Electric bass"
} { \clef "bass_8" \electricBass }

jazzGuitarPart = \new Staff \with {
  midiInstrument = "electric guitar (jazz)"
  instrumentName = "Jazz guitar"
} { \clef "treble_8" \jazzGuitar }

drumsPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "Drums"
} \drum

tenorVoicePart = \new Staff \with {
  instrumentName = "Tenor"
  midiInstrument = "choir aahs"
} { \clef "treble_8" \tenorVoice }
\addlyrics { \verseTenorVoice }

\score {
  \new GrandStaff <<
    \tenorVoicePart
    \jazzGuitarPart
    \electricBassPart
    \drumsPart
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}
