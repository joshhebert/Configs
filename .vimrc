" Plugins
" ===========================================================================
	call plug#begin('~/.vim/plugged')
		" Clean up all that gross whitespace
		Plug 'ntpeters/vim-better-whitespace'

		" Search on steroids
		Plug 'Shougo/vimproc.vim'
		Plug 'Shougo/unite.vim'

		" Git Plugins
		Plug 'airblade/vim-gitgutter'
		Plug 'tpope/vim-fugitive'

		" Easy Align
		Plug 'junegunn/vim-easy-align'

		" yeah boi, tab completion
		Plug 'ervandew/supertab'

		" Tagbar
		Plug 'majutsushi/tagbar'

        " Easy motion OP
        Plug 'Lokaltog/vim-easymotion'

        " Gotta look good
        Plug 'bling/vim-airline'
        Plug 'paranoida/vim-airlineish'

		" Annnnnnnndd Syntastic, because it rocks
		Plug 'scrooloose/syntastic'

    call plug#end()

" Plugin Configuration
" ===========================================================================
	" vim-better-whitespace
		let g:better_whitespace_enabled=0

		" Toggle Whitespace
		noremap <C-e> :ToggleWhitespace<cr>
		" Clean Whitesace
		noremap <C-w> :StripWhitespace<cr>

	" unite
		let g:unite_source_history_yank_enable = 1
		try
			let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
			call unite#filters#matcher_default#use(['matcher_fuzzy'])
		catch
		endtry
		" search a file in the filetree
		noremap <space><space> :<C-u>Unite -start-insert file_rec/async<cr>
		noremap <space>r <Plug>(unite_restart)

	" vim-easy-align
		vnoremap <silent> <Enter> :EasyAlign<cr>

	" git-gutter
		highlight clear SignColumn
		let g:gitgutter_realtime = 1

	" tagbar
		noremap <F8> :TagbarToggle<CR>

    " easymotion
        " I really just use easymotion to replace
        " Vim's built in search. It's tons better
        map  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)

        " These `n` & `N` mappings are options. You do not have to map `n` &
        " `N` to EasyMotion.
        " Without these mappings, `n` & `N` works fine. (These mappings just provide
        " different highlight method and have some other features )
        map  n <Plug>(easymotion-next)
        map  N <Plug>(easymotion-prev)

        let g:EasyMotion_do_mapping = 0 " Disable default mappings

        " Bi-directional find motion
        " Jump to anywhere you want with minimal keystrokes, with just one key binding.
        " `s{char}{label}`
        nmap s <Plug>(easymotion-s)
        " or
        " `s{char}{char}{label}`
        " Need one more keystroke, but on average, it may be more comfortable.
        nmap s <Plug>(easymotion-s2)

        " Turn on case insensitive feature
        let g:EasyMotion_smartcase = 1

        " JK motions: Line motions
        map <Leader>j <Plug>(easymotion-j)
        map <Leader>k <Plug>(easymotion-k)

    " airline
        " Set that theme
        let g:airline_theme = 'airlineish'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#whitespace#enabled = 0
        let g:airline_powerline_fonts = 1
        set fillchars+=stl:\ ,stlnc:\

    " syntastic
		set statusline+=%#warningmsg#
		set statusline+=%{SyntasticStatuslineFlag()}
		set statusline+=%*

		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 0

" User Config
" ===========================================================================
" Load filetype plugins
filetype plugin on
filetype indent on

" Language Specific Settings
" settings for the c language
au FileType c,h           set ai sw=4 ts=4 noexpandtab cindent omnifunc=ccomplete#Complete

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

" Load my clor scheme
colorscheme hashcheck

" automatically give executable permissions if file begins with #! and contains
" is a shell script
au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod a+x <afile> | endif

" Needed for some plugins
set nocp

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

" This is redundant because of airline
set noshowmode

" continue searching at top when hitting bottom
set wrapscan

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

set pumheight=7


" force using hjkl
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

" ==============================================
" Mappings
" ==============================================

" New tab with ctrl-t
map <C-t> ;tabnew<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
