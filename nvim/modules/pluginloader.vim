"==============================================================================
" Plugin Installation
"==============================================================================
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin( "~/.config/nvim/plugged" )
call dein#add( "~/.config/nvim/dein/repos/github.com/Shougo/dein.vim/" )

call dein#add( 'ntpeters/vim-better-whitespace' )
call dein#add( 'tpope/vim-surround' )
call dein#add( 'mbbill/undotree' )

call dein#add( 'airblade/vim-gitgutter' )
call dein#add( 'tpope/vim-fugitive' )

call dein#add( 'Shougo/deoplete.nvim' )

call dein#add( 'Lokaltog/vim-easymotion' )

call dein#add( 'vim-airline/vim-airline')
call dein#add( 'vim-airline/vim-airline-themes' )

call dein#add( 'leafgarland/typescript-vim' )
call dein#add( 'vim-ruby/vim-ruby' )
call dein#add( 'fatih/vim-go' )
call dein#add( 'zchee/deoplete-go', { 'build': 'make' } )


call dein#end( )

"==============================================================================
" Plugin Configuration
"==============================================================================
	" vim-better-whitespace
		let g:better_whitespace_enabled=1

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

    " Deoplete
        let g:deoplete#enable_at_startup = 1

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
        set laststatus=2
        set noshowmode

    " Golang stuff
        let g:go_fmt_autosave = 0
