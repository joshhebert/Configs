" Vim color file - neverland2-darker.vim
" Eyes are sober, this is the plan
" I'm sitting in a car heading Neverland
" Author: Magnus Woldrich <trapd00r@trapd00r.se>

set background=dark

hi Normal           ctermfg=255 ctermbg=232 

hi Boolean          ctermfg=135
hi Character        ctermfg=143
hi Number           ctermfg=033
hi String           ctermfg=179
hi Conditional      ctermfg=196              cterm=bold
hi Constant         ctermfg=135              cterm=bold
hi Cursor           ctermfg=150 ctermbg=253
hi Debug            ctermfg=225              cterm=bold
hi Define           ctermfg=081
hi Delimiter        ctermfg=241

hi DiffAdd                      ctermbg=232
hi DiffChange       ctermfg=181 ctermbg=234
hi DiffDelete       ctermfg=162 ctermbg=232
hi DiffText                     ctermbg=232 cterm=bold

hi Directory        ctermfg=118             cterm=bold
hi Error            ctermfg=219 ctermbg=232
hi ErrorMsg         ctermfg=199 ctermbg=232 cterm=bold
hi Exception        ctermfg=118             cterm=bold
hi Float            ctermfg=135
hi FoldColumn       ctermfg=067 ctermbg=233 cterm=none
hi Folded           ctermfg=240 ctermbg=235 cterm=bold
hi Function         ctermfg=197             
hi Identifier       ctermfg=166             
hi Ignore           ctermfg=244 ctermbg=232
hi IncSearch        ctermfg=193 ctermbg=16

hi Keyword          ctermfg=074             cterm=bold
hi Label            ctermfg=229             cterm=none
hi Macro            ctermfg=193
hi SpecialKey       ctermfg=081

hi MatchParen       ctermfg=196 ctermbg=234 cterm=bold
hi ModeMsg          ctermfg=215
hi MoreMsg          ctermfg=215
hi Operator         ctermfg=046

" complete menu
hi Pmenu            ctermfg=137 ctermbg=233 cterm=none
hi PmenuSel         ctermfg=196 ctermbg=234 cterm=bold
hi PmenuSbar        ctermfg=000 ctermbg=233 cterm=none
hi PmenuThumb       ctermfg=137 ctermbg=235 cterm=none

hi PreCondit        ctermfg=118             cterm=bold
hi PreProc          ctermfg=218
hi Question         ctermfg=081
hi Repeat           ctermfg=161             cterm=bold
hi Search           ctermfg=160 ctermbg=232

" marks column
hi SignColumn       ctermfg=118 ctermbg=235
hi SpecialChar      ctermfg=161             cterm=bold
hi SpecialComment   ctermfg=245             cterm=bold
hi Special          ctermfg=081 ctermbg=232
hi SpecialKey       ctermfg=245

hi SpellBad         ctermfg=196 ctermbg=233 cterm=bold
hi SpellCap         ctermfg=094 ctermbg=233 cterm=bold
hi SpellRare        ctermfg=096 ctermbg=233 cterm=bold
hi SpellLocal       ctermfg=124 ctermbg=233 cterm=bold

hi Statement        ctermfg=228             cterm=bold 
hi StatusLine       ctermfg=234 ctermbg=136
hi StatusLineNC     ctermfg=234 ctermbg=100
hi StorageClass     ctermfg=208
hi Structure        ctermfg=081
hi Tag              ctermfg=161
hi Title            ctermfg=021
hi Todo             ctermfg=160 ctermbg=232 cterm=bold

hi Typedef          ctermfg=081
hi Type             ctermfg=081             cterm=none
hi Underlined       ctermfg=244             cterm=underline

hi VertSplit        ctermfg=244 ctermbg=232 cterm=bold
hi VisualNOS                    ctermbg=238
hi Visual                       ctermbg=235
hi WarningMsg       ctermfg=021 ctermbg=238 cterm=bold
hi WildMenu         ctermfg=081 ctermbg=016

hi Comment          ctermfg=101
hi ColorColumn                  ctermbg=235
hi CursorLine                   ctermbg=234 cterm=none
hi CursorColumn                 ctermbg=234
hi LineNr           ctermfg=241 ctermbg=232
hi NonText          ctermfg=232 ctermbg=232

hi TabLine          ctermfg=100 ctermbg=232
hi TabLineFill      ctermfg=232 ctermbg=232
hi TabLineSel       ctermfg=220 ctermbg=234
