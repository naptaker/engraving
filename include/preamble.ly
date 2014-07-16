\version "2.16.0"
\include "articulate.ly"

#(set-default-paper-size "arch a" 'landscape)

\paper {
  print-page-number = ##f
	top-margin = 0.75\in
	left-margin = 0.75\in
	right-margin = 0.75\in
	bottom-margin = 0.75\in
}

#(set-global-staff-size 16)

\header {
%	tagline = "© 2013 Naptaker"
	copyright = ""
}


%%% MACROS %%%
sl = {
	\override NoteHead #'style = #'slash
	\override Stem #'transparent = ##t
}
nsl = {
	\revert NoteHead #'style
	\revert Stem #'transparent
}
crOn = \override NoteHead #'style = #'cross
crOff = \revert NoteHead #'style


#(define mydrums '(
  (bassdrum				default	#f	-3)
  (snare					default #f	1)
  (closedhihat		cross		#f	5)
  (halfopenhihat	xcircle	#f	5)
  (lowtom					default	#f	-1)
  (pedalhihat			cross		#f	-5)
  (crashcymbal		cross		#f	6)
  (ridecymbal			cross		#f	4)))

fretMagic = {
  \once \override TabNoteHead #'transparent = ##t
  \once \override NoteHead #'transparent = ##t
  \once \override Stem #'transparent = ##t
  \once \override Flag #'transparent = ##t
  \once \override NoteHead #'no-ledgers = ##t
  \once \override Glissando #'(bound-details left padding) = #0.3
}

#(define ((bars-per-line-engraver bar-list) context)
  (let* ((working-copy bar-list)
         (total (1+ (car working-copy))))
    `((acknowledgers
       (paper-column-interface
        . ,(lambda (engraver grob source-engraver)
             (let ((internal-bar (ly:context-property context 'internalBarNumber)))
               (if (and (pair? working-copy)
                        (= (remainder internal-bar total) 0)
                        (eq? #t (ly:grob-property grob 'non-musical)))
                   (begin
                     (set! (ly:grob-property grob 'line-break-permission) 'force)
                     (if (null? (cdr working-copy))
                         (set! working-copy bar-list)
                         (begin
                           (set! working-copy (cdr working-copy))))
                           (set! total (+ total (car working-copy))))))))))))
  
#(define-markup-command (draw-dashed-line layout props dest)
  (number-pair?)
  #:category graphic
  #:properties ((thickness 1)
                (on 1)
                (off 1)
                (phase 0))
  (let* ((th (* (ly:output-def-lookup layout 'line-thickness)
               thickness))
        (half-thick (/ th 2))
        (x (car dest))
        (y (cdr dest)))
    (ly:make-stencil
      (list 'dashed-line th on off x y phase)
        (interval-widen (ordered-cons 0 x) half-thick)
        (interval-widen (ordered-cons 0 y) half-thick))))
                           
scoreMagic = {
	\override BarNumber #'padding = #3
	\override RehearsalMark #'padding = #2
	\set Score.markFormatter = #format-mark-box-letters
}

startFuture = {
	\stopStaff
	\override Staff.StaffSymbol #'line-count = #1
	\startStaff \hideNotes
	\override Tie #'transparent = ##t
	\override Slur #'transparent = ##t
	\override Staff.Clef #'transparent = ##t
	\override Staff.KeySignature #'transparent = ##t
}

endFuture = {
	\stopStaff
	\revert Staff.StaffSymbol #'line-count
	\startStaff \unHideNotes
	\revert Tie #'transparent
	\revert Slur #'transparent
	\revert Staff.Clef #'transparent
	\revert Staff.KeySignature #'transparent
}

flam = \drummode { 
	\override Stem #'length = #4
	\acciaccatura { sn8 }
	\revert Stem #'length
}


%% http://lsr.di.unimi.it/LSR/Item?id=198
%% see also http://lsr.di.unimi.it/LSR/Item?id=190
theCoda = {
  \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \once \override Score.RehearsalMark.font-size = #6 
  \mark \markup { \musicglyph #"scripts.coda" }
}

% http://lsr.dsi.unimi.it/LSR/Snippet?id=664
toCoda = {
  % the align part
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \once \override Score.RehearsalMark #'direction = #DOWN
  %prefered size
  \once \override Score.RehearsalMark #'font-size = #-2
  \mark \markup {
    \center-column {
      \concat { \lower #1 { "D.S. al  " } { \musicglyph #"scripts.coda" } }
      \italic { \lower #1 { \small "play both endings" } }
    }
  }
}

breakingCoda = {
  \break
  \once \override Score.RehearsalMark.font-size = #6 
  \mark \markup { \musicglyph #"scripts.coda" }
}


%%%%%%%%%%%%%%%%%% 
#(define ((my-stencils start) grob) 
(let* ((par-list (parentheses-item::calc-parenthesis-stencils grob)) 
        (null-par (grob-interpret-markup grob (markup #:null)))) 
  (if start 
     (list (car par-list) null-par) 
     (list null-par (cadr par-list))))) 

startParenthesis = #(define-music-function (parser location note) 
(ly:music?) 
"Add an opened parenthesis to the left of `note" 
#{ 
  \once \override ParenthesesItem #'stencils = #(my-stencils #t) 
  \parenthesize $note 
#}) 

endParenthesis = #(define-music-function (parser location note) (ly:music?) 
"Add a closed parenthesis to the right of `note" 
#{ 
  \once \override ParenthesesItem #'stencils = #(my-stencils #f) 
  \parenthesize $note 
#})

%%%%%%%%%%%%%%%%%%