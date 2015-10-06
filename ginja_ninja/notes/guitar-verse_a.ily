\chordmode {
  %% bes,,8:1.5.8 q q |
  \set Timing.measurePosition = #(ly:make-moment -3/8)
  \repeat tremolo 3 { bes,,8:1.5.8 } |
  %% c,4:1.5.8 q8 q4 g,,8:1.5.8 q q |
  c,4:1.5.8 q8 q4 \repeat tremolo 3 { g,,8:1.5.8 } |
  %% a,,4:1.5.8 q8 q4 q8 q g,,:1.5.8 |
  a,,4:1.5.8 q8 q4 \repeat tremolo 2 { q8 } g,,:1.5.8 |
  %% ees,8:1.5.8 q q q q f,:1.5.8 q c,:1.5.8 |
  \repeat tremolo 4 { ees,8:1.5.8 } q8 \repeat tremolo 2 { f,:1.5.8 } c,:1.5.8 |
}
