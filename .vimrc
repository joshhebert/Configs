" ========================================
" Settings
" ========================================

" Load filetype plugins
filetype plugin on
filetype indent on

" Language Specific Settings
" settings for the c language
au FileType c,h           set ai sw=4 ts=4 noexpandtab cindent omnifunc=ccomplete#Complete
" settings for python
au FileType python set ai expandtab

let s  = ""
let s .= "%<"                                 | " truncate at the start
let s .= "%f%8* "                             | " file name
let s .= "%r"                                 | " readonly flag
let s .= '%{&bomb?"!":""} '                   | " byte-order mark flag
let s .= "%*%="                               | " right-justify after here
let s .= "%9*%m%* "                           | " modified flag
let s .= "0x%02B "                            | " hex value of current byte
let s .= "%l"                                 | " current line
let s .= ":%c%V"                              | " column number, virtual column (if different)
let s .= " %P"                                | " percentage
let s .= "/%LL"                               | " number of lines
set statusline=%!s

" Xresources colors
let g:hybrid_use_Xresources = 1
" This needs to be installed
colorscheme hybrid

" automatically give executable permissions if file begins with #! and contains
" is a shell script
au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod a+x <afile> | endif


" My terminal is fast
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread

" For regular expressions turn magic on
set magic

" show the laststatus line always
set laststatus=2

" give cursor position
set ruler

" number of undos
set undolevels=200

" jump to the word you search during you type
set incsearch
set ignorecase

" Smartcase
set smartcase

"Fix backspace in insert mode to be sane
set backspace=indent,eol,start"

" English spellfile
set spelllang=en

" highlight search results
set hlsearch

" we use a dark background 
set background=dark

" fuck the beeps
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" for hidden buffers
set hidden

" continue searching at top when hitting bottom
set wrapscan

"always show the command
set showcmd

" Continue searching at top when hitting bottom
set wrapscan
set smarttab

" show all changes
set report=0

" highlight current line
set cursorline

" Highlight matching parens
set showmatch
set matchpairs=(:),[:],{:},<:>
set mat=2

" All  things indenting and tab related
set smartindent
set smarttab
set expandtab
set softtabstop=4
set shiftwidth=4

" Scrolling lock
set scrolloff=100

" fancy menu
set wildmenu
set wildmode=list:longest,full

" Put evrything that should be in tmp in tmp
set backupdir=/tmp
set directory=/tmp

" display utf-8 chars
set encoding=utf-8

" enumerate Lines
set nu

" after 75 characters write a swap file
set uc=75

" tab width 
set tabstop=4

" do not behave like vi, vi is dead 
set nocompatible

" use the modelines commands
set modeline

" use 3 lines for modelines
set modelines=3

" Use brighter colors if your xterm has a dark background.
set background=dark

" 256 colors
se t_Co=256

" Highlight the word under the cursor
highlight flicker cterm=bold ctermfg=white
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" Center the line when searching
map n nzz
map N Nzz

"========================
" Syntax higlighting
"========================

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*


let color = "true"

if has("syntax")
    if color == "true"
		" This will switch colors ON
		so ${VIMRUNTIME}/syntax/syntax.vim
	else
		" this switches colors OFF
		syntax off
		set t_Co=0
    endif
endif

set pumheight=7

" comment types 
set comments=b:#,:%,fb:-,n:),n:> fo=cqrt

" Key bindings

" force using hjkl$
noremap <Up>       :echoerr "Arrow keys disabled in command mode"<CR>$,
noremap <Down>     :echoerr "Arrow keys disabled in command mode"<CR>$,
noremap <Left>     :echoerr "Arrow keys disabled in command mode"<CR>$,
noremap <Right>    :echoerr "Arrow keys disabled in command mode"<CR>$,

"fix pasting so you dont get the step down effect
nnoremap  :set invpaste paste?

" Swap the two weird apostrophe things
nnoremap ' `
nnoremap ` '

" Swap : and ; because #convenience
nnoremap ; :
nnoremap : ;

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" ==============================================
" Mappings
" ==============================================

" use shell with ctrl-z
map <C-Z> :shell

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" ==============================================
" Functions
" ==============================================

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    %exe "normal `z"
endfunc

