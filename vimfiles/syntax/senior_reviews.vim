" Vim syntax file
" Language:	Senior Reviews for CSS
" Maintainer:	Chandran Pfitzner (cpfitzner@internode.com.au)
" Last Change:	2011 Jan 04
"
" Note:
"  - For Internode internal use only

if exists("b:current_syntax")
	finish
endif

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif


syntax match header /ticket - username - delay - further ts required? - note/

syntax match ticket /^\d\{7}/

syntax keyword staff esankey lcameron jjinnett bsmyth jhstark pjenning crayner ajordan lgray ccarter mwinkler mashby tgrund asabic mtavella cpfitzne jreubeni

syntax match delay / \d\{-} minute[s ]\| \d\{-} hour[s ]\| \d\{-}\.\d hours\| \d\{-} day[s ]\| \d\{-}\.\d days/
syntax match nodelay / 0 /

syntax match morets / yes /
syntax match nomorets /-\zs no /

syntax keyword vs VS contained
syntax keyword etechs etechs contained
syntax keyword ii II contained
syntax match enddata /-\zs [^-]\{-}\n/ contains=vs,etechs,ii


highlight link header MatchParen
highlight link ticket Comment
highlight link staff Special
highlight link delay PreProc
highlight link nodelay SpecialKey
highlight link morets LineNr
highlight link nomorets Directory
highlight link enddata Identifier
highlight link vs LineNr
highlight link etechs Constant
highlight link ii Question


let b:current_syntax = "iim"
