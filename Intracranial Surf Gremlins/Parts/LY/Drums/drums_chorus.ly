voltaFirst = \markup { 1. \text \italic { play 1x only } }

duChorus = \drummode {
	\set Score.repeatCommands = #'(start-repeat)
	s4 sn8 sn4 s8 sn4 |
	s4 sn8 s4 sn8 sn sn |
	s4 sn8 s4. sn4 |
	s4 sn8 s4 sn8 tomfl sn |
	s4 sn8 sn4 s8 sn4 |
	s4 sn8 s4 sn8 tomfl sn |
	s4 sn8 sn16 tomfl s4 sn |
  \set Score.repeatCommands = #(list(list 'volta voltaFirst))
	s4 sn8 s4 sn8 sn sn |
	\once \override Score.RehearsalMark #'outside-staff-priority = #5000
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\once \override Score.RehearsalMark #'break-align-symbols = #'(volta)
  \set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
	s4 sn8 s4 sn8 sn sn |
	\set Score.repeatCommands = #'((volta #f))
	
	s8 tomfl s tomfl s tomfl16 tomfl s8 tomfl |
	s8 tomfl sn s4 sn8 sn4 |
}

ddChorus = \drummode {
	\set Score.repeatCommands = #'(start-repeat)
	bd4 s8 s4 bd8 s4 |
	bd4 s8 bd4 s4. |
	bd4 s8 bd4 bd8 s4 |
	bd4 s8 bd4 s4. |
	bd4 s8 s4 bd8 s4 |
	bd4 s8 bd4 s4. |
	bd4 s bd8 bd s4 |
  \set Score.repeatCommands = #(list(list 'volta voltaFirst))
	bd4 s8 bd4 s4. |
	\once \override Score.RehearsalMark #'outside-staff-priority = #5000
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\once \override Score.RehearsalMark #'break-align-symbols = #'(volta)
  \set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
  bd4 s8 bd4 s4. |
	\set Score.repeatCommands = #'((volta #f))
	
	bd8 s bd s bd s bd s |
	bd s s bd4 s8 s4 |
}