\relative c {
  \repeat volta 3 {
    \chordmode {
      c,2.:1.5.8.10.12.15  ~ q2 r4 |
      b,,2.:1.5.8.10.12.15 ~ q2 r4 |
      f,2.:1.5.8.10.12.15  ~ q2 r4 |
    }
  }
  \alternative {
    { e4   \chordmode { e,:1.5.8.10.12.15 }   r
      ees4 \chordmode { ees,:1.5.8.10.12.15 } r |   }
    { \break g4 a g f e d | }
  }
  c4 r r \chordmode { f,:1.5.8.10.12.15 } r r |
  \chordmode { c,1.:1.5.8.10.12.15 } |
}
