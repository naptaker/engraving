\version "2.18.2"

\include "articulate.ly"

%%%% headers/header.ily
licenseNotice = "This work is licensed under a Creative Commons Attribution 4.0 International License."
licenseLink   = "http://creativecommons.org/licenses/by/4.0/"

\header {
  arranger  = \markup {
    \column {
      \right-align "Arr. by S. Albers, E. Bailey"
      \right-align "P. Drum, and A. Smith"
    }
  }
  tagline   = ##f
  copyright = \markup {
    \center-column {
      \teeny \licenseNotice
      \teeny \licenseLink
      \small "© 2015 Naptaker"
    }
  }
}

\paper {
  top-margin    = 0.75\in
  right-margin  = 0.5\in
  bottom-margin = 0.75\in
  left-margin   = 0.5\in
}

%%%%


%%%% headers/ginja_ninja.ily

\header {
  title    = "Ginja Ninja"
  composer = "Music by E. Bailey and P. Drum"
  %% poet     = "Words by A. Smith"
}

%%%%


#(set! %load-path `("scheme" ,@%load-path))
#(load-from-path "custom-line-breaks-engraver.scm")

Key    = { \key c \major }
Tempo  = { \tempo 4 = 300 }
global = { \Tempo \defaultTimeSignature \time 4/4 }


instrumentName = "Guitar"
partNotes      = {
  \clef "treble_8"
  \Key

  \set countPercentRepeats = ##t
  \include "guitar-intro.ily"
  \break

  %% \mark "Noodle"
  \include "guitar-solo.ily"
  \break

  \bar "[|:"
  \repeat volta 2 {
    %% \mark "Verse"
    \include "guitar-verse.ily"
    \break
    %% \mark "Chorus"
    \include "guitar-chorus.ily"
  }
  \bar ":|]"

  \mark \markup { \musicglyph #"scripts.coda" }
  \set Timing.measurePosition = #(ly:make-moment 0)
  \time 6/4
  r2. r |
  \break
  \include "guitar-coda.ily"
  \bar "|."
}

midiNotes = \partNotes


#(set-global-staff-size 25)
#(set-default-paper-size "letter" 'portrait)

\paper {
  bottom-margin = .5\in
  max-systems-per-page = 8
}

\header {
  instrument = \instrumentName
}

partDefaults = {
  \accidentalStyle "modern"
  \override MultiMeasureRest #'expand-limit = 8
  \compressFullBarRests
  \numericTimeSignature
}


\score {
  \new Staff {
    \partDefaults
    << \global \partNotes >>
  }
  \layout {
    indent = 0\in
    \context {
      \Score
                                % \override NonMusicalPaperColumn #'line-break-permission = ##f
                                % \consists #(custom-line-breaks-engraver '(4))
    }
  }
}


\score {
  <<
    \unfoldRepeats \articulate
    \new Staff {
      << \global \midiNotes >>
    }
  >>
  \midi {
    \context {
      \Staff
      \remove "Staff_performer"
    }
    \context {
      \Voice
      \consists "Staff_performer"
    }
  }
}
