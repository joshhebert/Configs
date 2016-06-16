fun! VexToggle(dir)
    if exists("t:vex_buf_nr")
        call VexClose()
    else
        call VexOpen(a:dir)
    endif
endf

fun! VexOpen(dir)
    let g:netrw_browse_split=4
    let vex_width = 40
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

let g:netrw_liststyle=3         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

" Bind it
noremap <space><space> :<C-u>call VexToggle("")<cr>

