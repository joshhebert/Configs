" Plugins
" ===========================================================================
	call plug#begin('~/.vim/plugged')
		" Clean up all that gross whitespace
		Plug 'ntpeters/vim-better-whitespace'

		" Git Plugins
		Plug 'airblade/vim-gitgutter'
		Plug 'tpope/vim-fugitive'

		" Better autocompletion
        " Make sure you use single quotes
        Plug 'Valloric/YouCompleteMe', { 'do': 'python2.7 ./install.py' }

        " Why does nobody know these are a thing?
        Plug 'mbbill/undotree'

        " Easy motion OP
        Plug 'Lokaltog/vim-easymotion'

        " Gotta look good
        Plug 'bling/vim-airline'

        " Language specific improvement
            " JS/Angular
            Plug 'jelera/vim-javascript-syntax'
            Plug 'othree/javascript-libraries-syntax.vim'

            " Ruby
            Plug 'vim-ruby/vim-ruby'

            " Gradle
            Plug 'tfnico/vim-gradle'
        call plug#end()


" Set up NetRw to actually be useful
" ===========================================================================
    fun! VexToggle(dir)
      if exists("t:vex_buf_nr")
        call VexClose()
      else
        call VexOpen(a:dir)
      endif
    endf

    fun! VexOpen(dir)
      let g:netrw_browse_split=4
      let vex_width = 27
      exe "Vexplore " . a:dir
      let t:vex_buf_nr = bufnr("%")
      wincmd H

      call VexSize(vex_width)
    endf

    fun! VexClose()
      let cur_win_nr = winnr()
      let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

      1wincmd w
      close
      unlet t:vex_buf_nr

      exe (target_nr - 1) . "wincmd w"
      call NormalizeWidths()
    endf

    fun! VexSize(vex_width)
      exe "vertical resize" . a:vex_width
      set winfixwidth
      call NormalizeWidths()
    endf

    fun! NormalizeWidths()
      let eadir_pref = &eadirection
      set eadirection=hor
      set equalalways! equalalways!
      let &eadirection = eadir_pref
    endf

    let g:netrw_liststyle=0         " thin (change to 3 for tree)
    let g:netrw_banner=0            " no banner
    let g:netrw_altv=1              " open files on right
    let g:netrw_preview=1           " open previews vertically

    " Bind it
    noremap <space><space> :<C-u>call VexToggle("")<cr>

" Plugin Configuration
" ===========================================================================
	" vim-better-whitespace
		let g:better_whitespace_enabled=0

		" Toggle Whitespace
		noremap <C-E> :ToggleWhitespace<cr>
		" Clean Whitesace
		noremap <C-e> :StripWhitespace<cr>


	" git-gutter
		highlight clear SignColumn
		let g:gitgutter_realtime = 1

    " UndoTree
        " Open UndoTree and switch focus to it
        nnoremap <C-u> :UndotreeToggle<cr><C-w>w
        let g:undotree_DiffAutoOpen = 0


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
        nmap s <Plug>(easymotion-s2)

        " Turn on case insensitive feature
        let g:EasyMotion_smartcase = 1

    " airline
        " Set that theme
        let g:airline_theme = 'base16'
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

    set nocompatible

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


    " Sharing is caring (use system clipboard as primary buffer)
    " This allows us to yank between vim processes
    " Requires vim to be compiled with +xterm_clipboard
    " On archlinux, this can be done without compiling vim from source by
    " installing gvim
    set clipboard=unnamed

" Syntax Stuff
" ===========================================================================

    " Needed for Syntax Highlighting and stuff
    filetype on
    filetype plugin on
    syntax enable
    set grepprg=grep\ -nH\ $*

    set pumheight=7

    " Folding is cool
    set foldmethod=syntax
    " But not too much
    set foldnestmax=1
    set foldlevel=99
" Mappings
" ===========================================================================
    " Swap the two weird apostrophe things
    nnoremap ' `
    nnoremap ` '

    " Swap : and ; because #convenience
    nnoremap ; :
    nnoremap : ;

    " New tab with ctrl-t
    map <C-t> ;tabnew<CR>

    " Switch panes with <C-Space>
    " Vim is just dumb, interprets <C-Space> as
    " <NUL>, so I have to use that instead
    nnoremap <NUL> <C-w>w

    " Treat long lines as break lines (useful when moving around in them)
    " Also, using jk for course motion and arrow keys for fine motion is nice
    nnoremap <Up>   gk
    nnoremap <Down> gj
    map j gj
    map k gk

    " I don't really like navigating with h/l
    " If I'm already doing fine navigation, I'm using arrow keys
    " So let's make them do something more useful
    " Like handle folding
    map h zc
    map l zo

    " Make vim panes usable with my tmux setup (and also more sane)
    nnoremap <C-h> <C-w><C-h>
    nnoremap <C-j> <C-w><C-j>
    nnoremap <C-k> <C-w><C-k>
    nnoremap <C-l> <C-w><C-l>

    " You want something fancy? This shows the syntax type of the element
    " under the cursor. EZ themeing
    map <F10> ;echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'. synIDattr(synID(line("."),col("."),0),"name") . "> lo<". synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" This needs to be last to work (hell if I know why)
" ===========================================================================
set noshowmode

" Load my color scheme
" ===========================================================================
hi clear
" No BCE (Background Colour Erase)
set t_ut=
colorscheme neverland
