
if has('nvim')

    tnoremap <C-w>w <C-\><C-n><C-w>w
    tnoremap <C-w>h <C-\><C-n><C-w>h
    tnoremap <C-w>j <C-\><C-n><C-w>j
    tnoremap <C-w>k <C-\><C-n><C-w>k
    tnoremap <C-w>l <C-\><C-n><C-w>l

    tnoremap <C-w>H <C-\><C-n><C-w>H
    tnoremap <C-w>J <C-\><C-n><C-w>J
    tnoremap <C-w>K <C-\><C-n><C-w>K
    tnoremap <C-w>L <C-\><C-n><C-w>L

    " Use Alt + ; to go to normal mode
    " tnoremap <A-;> <C-\><C-n>
    " Use Alt + Shift + ; to go to command mode
    " tnoremap <A-:> <C-\><C-n>:
    " Open new terminals in splits
    cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'split term://bash' : 'term')<CR>
    cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>
    augroup term_cmds
        autocmd!
        " Bypass normal mode when changing focus to terminal buffer
        autocmd BufWinEnter,WinEnter term://* startinsert
        " Toggle numbers off when in terminal mode, on when in normal mode
        autocmd TermEnter term://* setlocal nonu nornu
        autocmd TermLeave term://* setlocal nu rnu
        " Immediately close terminal window when process finishes
        autocmd TermClose term://* close
    augroup END
else
    " Use Alt + ; to go to normal mode
    tnoremap <A-:> <C-w><S-n>
    " Use Alt + Shift + ; to go to command mode
    tnoremap <A-:> <C-w><S-n>:
    cnoreabbrev vterm vert term
endif
