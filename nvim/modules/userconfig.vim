" =============================================================================
" User Config
" =============================================================================
    " Load filetype plugins
    filetype plugin on
    filetype indent on

    " Autoconfigure for specific languages
    au BufRead,BufNewFile *.go set filetype=go

    " Set to auto read when a file is changed from the outside
    set autoread

    " For regular expressions turn magic on
    set magic

    " give cursor position
    set ruler

    " number of undos
    set undolevels=500

    " jump to the word you search during you type
    set incsearch
    set ignorecase

    " Smartcase
    set smartcase

    " Fix backspace in insert mode to be sane
    set backspace=indent,eol,start"

    " English spellfile
    set spelllang=en

    " fuck the beeps
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    " for hidden buffers
    set hidden

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

    " Scrolling lock (Try to keep the cursor in the center
    " of the window, except neer the ends)
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
    set rnu

    " after 75 characters write a swap file
    set uc=75

    " tab width
    set tabstop=4

    " 256 colors
    set t_Co=256

    " fix pasting so you dont get the step down effect
    nnoremap  :set invpaste paste?

    " Disable scrath window
    set completeopt-=preview

    " This allows us to yank between vim processes
    " Requires vim to be compiled with +xterm_clipboard
    " On archlinux, this can be done without compiling vim from source by
    " installing gvim
    set clipboard=unnamed

" =============================================================================
" Syntax Stuff
" =============================================================================
    filetype on
    filetype plugin on
    syntax enable

" =============================================================================
" Mappings
" =============================================================================
    nnoremap ; :
    nnoremap : ;

    " New tab with ctrl-t
    map <C-t> ;tabnew<CR>

    " Switch panes with <C-Space>
    " Vim is just dumb, interprets <C-Space> as
    " <NUL>, so I have to use that instead
    nnoremap <NUL> <C-w>w

    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk

    map <F10> ;echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'. synIDattr(synID(line("."),col("."),0),"name") . "> lo<". synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

    "Make it so left and right/h and l wrap
    set whichwrap+=<,>,h,l,[,]

" =============================================================================
" Load my color scheme
" =============================================================================
    hi clear
    " No BCE (Background Colour Erase)
    set colorcolumn=80
    set t_ut=
    colorscheme neverland
