set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"""""""""""""""""""""
" My config changes "
"""""""""""""""""""""

"change the window size from the default of 50/100
set lines=70 columns=140

"window size modifier bindings
"map <F9> :set lines-=1<CR> "decrease height by 1 line
"map <F10> :set lines+=1<CR> "increase height by 1 line
"map <F11> :set columns-=1<CR> "decrease width by 1 column
"map <F12> :set columns+=1<CR> "increase width by 1 column

"set the default save directory to that of the file you're currently editing
set autochdir

" Tell vim to remember certain things when we exit
"  '10  :	marks will be remembered for up to 10 previously edited files
"  "100 :	will save up to 100 lines for each register
"  :200 :	up to 200 lines of command-line history will be remembered
"  n... : 	where to save the viminfo files
set viminfo='10,\"100,:200,n~\\My\ Documents\\Vim\\_viminfo

"change the way autocomplete works
set wildmode=longest,list,full
set wildmenu

"set default colour scheme to neverland-darker-c
colorscheme neverland-darker-c

"set the font
set guifont=DejaVu\ Sans\ Mono

"turn highlighting of the cursor line & column on
set cursorline
set cursorcolumn


"set the maximum number of tabs to 50
set tabpagemax=50

"unmap <C-A> from select all back to increment number
nunmap <C-A>

"unmap <C-Y> from redo back to scroll up 1 line
nunmap <C-Y>

"make Y act in a more logical manner just as C and D does
map Y y$

"tab and shift-tab to go through the tabs
nmap <Tab> gt
nmap <S-Tab> gT

"map <C-v> to <C-r>* so pasting with <C-v> in replace mode overwrites properly
imap <C-v> <C-r>*

"syntax highlighting for html in string in php files
let php_htmlInStrings = 1

"set relativenumbers
set relativenumber

"set swap files to be located locally
set dir=C:\\Documents\ and\ Settings\\cpfitzne\\My\ Documents\\Vim\\vimfiles\\swap

"turn on spell checking
set spell

"make ~ an operator so you can use movement commands on it
set tildeop

"map <C-L> to disable search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

"for surround plugin, lets us surround stuff with the php thingy
autocmd FileType php let b:surround_45 = "<?php \r ?>"

"swap the mark mapping keys
noremap ` '
noremap ' `
