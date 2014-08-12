" File:       hashcheck.vim
" Maintainer: Josh Hebert (jhebes)
" URL:        https://github.com/jhebes/Configs/.vim/colors/hashcheck.vim
" Modified:   27 Jan 2013 07:33 AM AEST
" License:    MIT

" Description:
" ----------------------------------------------------------------------------
" My own peronal vim color scheme


" Requirements And Recommendations:
" ----------------------------------------------------------------------------
" This colourscheme is intended for use on:
"   - Vim 7.3 for Linux, using a 256 colour enabled terminal.
"

" Initialisation:"
" ----------------------------------------------------------------------------
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "hashcheck"

" GUI And Cterm Palettes:"
" ----------------------------------------------------------------------------
let s:vmode      = "cterm"
let s:foreground = "15"   " White

let s:white 	= "255"
let s:lightgrey = "252"
let s:grey 		= "246"
let s:darkgrey	= "240"
let s:black		= "232"

let s:blue       = "21"   
let s:darkblue   = "19"

let s:cyan       = "87"   
let s:darkcyan   = "38"

let s:red        = "160"   
let s:darkred    = "88"

let s:purple     = "90"   
let s:darkpurple = "53"

let s:orange     = "172"   

let s:yellow     = "190"   

let s:green      = "82"  




" Formatting Options:"
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

" Highlighting Primitives:
" ----------------------------------------------------------------------------
" BG
exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_default = ' ".s:vmode."bg=".s:none."'"

exe "let s:bg_white      = ' ".s:vmode."bg=".s:white     ."'"
exe "let s:bg_lightgrey  = ' ".s:vmode."bg=".s:lightgrey ."'"
exe "let s:bg_grey       = ' ".s:vmode."bg=".s:grey      ."'"
exe "let s:bg_darkgrey   = ' ".s:vmode."bg=".s:darkgrey  ."'"
exe "let s:bg_black      = ' ".s:vmode."bg=".s:black     ."'"

exe "let s:bg_red        = ' ".s:vmode."bg=".s:red       ."'"
exe "let s:bg_darkred    = ' ".s:vmode."bg=".s:darkred   ."'"

exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"

exe "let s:bg_yellow     = ' ".s:vmode."bg=".s:yellow    ."'"

exe "let s:bg_green      = ' ".s:vmode."bg=".s:green     ."'"

exe "let s:bg_cyan       = ' ".s:vmode."bg=".s:cyan      ."'"
exe "let s:bg_darkcyan   = ' ".s:vmode."bg=".s:darkcyan  ."'"

exe "let s:bg_blue       = ' ".s:vmode."bg=".s:blue      ."'"
exe "let s:bg_darkblue   = ' ".s:vmode."bg=".s:darkblue  ."'"

exe "let s:bg_purple     = ' ".s:vmode."bg=".s:purple    ."'"
exe "let s:bg_darkpurple = ' ".s:vmode."bg=".s:darkpurple."'"


" FG
exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_default = ' ".s:vmode."fg=".s:foreground."'"

exe "let s:fg_white      = ' ".s:vmode."fg=".s:white     ."'"
exe "let s:fg_lightgrey  = ' ".s:vmode."fg=".s:lightgrey ."'"
exe "let s:fg_grey       = ' ".s:vmode."fg=".s:grey      ."'"
exe "let s:fg_darkgrey   = ' ".s:vmode."fg=".s:darkgrey  ."'"
exe "let s:fg_black      = ' ".s:vmode."fg=".s:black     ."'"

exe "let s:fg_red        = ' ".s:vmode."fg=".s:red       ."'"
exe "let s:fg_darkred    = ' ".s:vmode."fg=".s:darkred   ."'"

exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"

exe "let s:fg_yellow     = ' ".s:vmode."fg=".s:yellow    ."'"

exe "let s:fg_green      = ' ".s:vmode."fg=".s:green     ."'"

exe "let s:fg_cyan       = ' ".s:vmode."fg=".s:cyan      ."'"
exe "let s:fg_darkcyan   = ' ".s:vmode."fg=".s:darkcyan  ."'"

exe "let s:fg_blue       = ' ".s:vmode."fg=".s:blue      ."'"
exe "let s:fg_darkblue   = ' ".s:vmode."fg=".s:darkblue  ."'"

exe "let s:fg_purple     = ' ".s:vmode."fg=".s:purple    ."'"
exe "let s:fg_darkpurple = ' ".s:vmode."fg=".s:darkpurple."'"

" Formatting
exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

let s:sp_none       = ""
let s:sp_foreground = ""
let s:sp_background = ""
let s:sp_red        = ""
let s:sp_orange     = ""
let s:sp_yellow     = ""
let s:sp_green      = ""
let s:sp_cyan       = ""
let s:sp_blue       = ""
let s:sp_purple     = ""
let s:sp_darkblue   = ""
let s:sp_darkcyan   = ""
let s:sp_darkred    = ""
let s:sp_darkpurple = ""

" Vim Highlighting: (see :help highlight-groups)"
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_default        .s:fmt_none
"		Conceal"
"		Cursor"
"		CursorIM"
exe "hi! CursorColumn"  .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! CursorLine"    .s:fg_default        .s:bg_default        .s:fmt_bold
exe "hi! Directory"     .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! DiffChange"    .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! DiffDelete"    .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! DiffText"      .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_default        .s:bg_default        .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! Folded"        .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! FoldColumn"    .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! SignColumn"    .s:fg_default        .s:bg_default        .s:fmt_none
"		Incsearch"
exe "hi! LineNr"        .s:fg_darkgrey          .s:bg_none           .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_red            .s:bg_none           .s:fmt_none
exe "hi! MatchParen"    .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! ModeMsg"       .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! MoreMsg"       .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! NonText"       .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! Pmenu"         .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! PmenuSel"      .s:fg_default        .s:bg_default        .s:fmt_revr
"		PmenuSbar"
"		PmenuThumb"
exe "hi! Question"      .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! Search"        .s:fg_default        .s:bg_default        .s:fmt_none
exe "hi! SpecialKey"    .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! SpellCap"      .s:fg_default        .s:bg_default        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_default        .s:bg_default        .s:fmt_undr
exe "hi! SpellBad"      .s:fg_default        .s:bg_default        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_default        .s:bg_default        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_default        .s:bg_default        .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_default        .s:bg_default        .s:fmt_revr
exe "hi! TabLine"       .s:fg_default        .s:bg_default        .s:fmt_revr
"		TabLineFill"
"		TabLineSel"
exe "hi! Title"         .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! Visual"        .s:fg_default        .s:bg_default        .s:fmt_none
"		VisualNos"
exe "hi! WarningMsg"    .s:fg_default        .s:bg_none           .s:fmt_none
"		WildMenu"

exe "hi! Normal"        .s:fg_default        .s:bg_default        .s:fmt_none


" Generic Syntax Highlighting: (see :help group-name)"
" ----------------------------------------------------------------------------
exe "hi! Comment"       .s:fg_darkgrey        .s:bg_none           .s:fmt_none
exe "hi! Constant"      .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! String"        .s:fg_default        .s:bg_none           .s:fmt_none
"		Character"
"		Number"
"		Boolean"
"		Float"

exe "hi! Identifier"    .s:fg_default        .s:bg_none           .s:fmt_none
exe "hi! Function"      .s:fg_default        .s:bg_none           .s:fmt_none

exe "hi! Statement"     .s:fg_default        .s:bg_none           .s:fmt_none
"		Conditional"
"		Repeat"
"		Label"
exe "hi! Operator"      .s:fg_default        .s:bg_none           .s:fmt_none
"		Keyword"
"		Exception"

exe "hi! PreProc"       .s:fg_default        .s:bg_none           .s:fmt_none
"		Include"
"		Define"
"		Macro"
"		PreCondit"

exe "hi! Type"          .s:fg_default        .s:bg_none           .s:fmt_none
"		StorageClass"
exe "hi! Structure"     .s:fg_default        .s:bg_none           .s:fmt_none
"		Typedef"

exe "hi! Special"       .s:fg_default        .s:bg_none           .s:fmt_none
"		SpecialChar"
"		Tag"
"		Delimiter"
"		SpecialComment"
"		Debug"
"
exe "hi! Underlined"    .s:fg_default        .s:bg_none           .s:fmt_none

exe "hi! Ignore"        .s:fg_default        .s:bg_none           .s:fmt_none

exe "hi! Error"         .s:fg_default        .s:bg_darkred        .s:fmt_undr

exe "hi! Todo"          .s:fg_default        .s:bg_none           .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"      .s:fg_default        .s:bg_none           .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

" Diff Syntax Highlighting:
" ----------------------------------------------------------------------------
hi! link diffRemoved Constant
hi! link diffAdded Special
