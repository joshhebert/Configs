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

		" Better autocompletion
        Plug 'Valloric/YouCompleteMe'

        " Easy motion OP
        Plug 'Lokaltog/vim-easymotion'

        " Gotta look good
        Plug 'bling/vim-airline'

        " Language specific improvement
            " JS/Angular
            Plug 'pangloss/vim-javascript'
            Plug 'othree/javascript-libraries-syntax.vim'
            " Ruby
            Plug 'vim-ruby/vim-ruby'

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
        let g:airline_theme = 'hybrid'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#whitespace#enabled = 0
        let g:airline_powerline_fonts = 1
        set fillchars+=stl:\ ,stlnc:\
        set timeoutlen=5

" User Config
" ===========================================================================
" Load filetype plugins
filetype plugin on
filetype indent on

" Language Specific Settings
" settings for the c language
au FileType c,h           set ai sw=4 ts=4 noexpandtab cindent omnifunc=ccomplete#Complete

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

"Make it so left and right/h and l wrap
set whichwrap+=<,>,h,l,[,]

" English spellfile
set spelllang=en

" highlight search results
set hlsearch

" fuck the beeps
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" for hidden buffers
set hidden

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

" use the modelines commands
set modeline

" use 3 lines for modelines
set modelines=3

" 256 colors
set t_Co=256

" fix pasting so you dont get the step down effect
nnoremap  :set invpaste paste?

" Let's make vim panes not suck, shall we?
set splitbelow
set splitright

" Sharing is caring (use system clipboard as primary buffer)
" This allows us to yank between vim processes
" Requires vim to be compiled with +xterm_clipboard
set clipboard=unnamed

" Syntax higlighting
" ===========================================================================

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

set pumheight=7


" Mappings
" ===========================================================================

" hjkl for course, arrow keys for fine
noremap <Up>       k 
noremap <Down>     j
noremap <Left>     h
noremap <Right>    l

" Swap the two weird apostrophe things
nnoremap ' `
nnoremap ` '

" Swap : and ; because #convenience
nnoremap ; :
nnoremap : ;

" New tab with ctrl-t
map <C-t> ;tabnew<CR>

" Treat long lines as break lines (useful when moving around in them)
map j 5gj
map k 5gk

" Make vim panes usable with my tmux setup (and also more sane)
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" This needs to be last to work (hell if I know why)
" ===========================================================================
set noshowmode

" Load my color scheme
" ===========================================================================
hi clear
" No BCE (Background Colour Erase)
set t_ut=
colorscheme neverland
