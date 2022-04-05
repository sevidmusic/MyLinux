" Settings

" Set tab to actually be 4 spaces | @see
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces for a
" good explanation.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" turn on spell check
set spell

" turn on line numbers
set number

" turn on relative numbers
set relativenumber

" turn off line wrapping
set nowrap

" Add a color column at line 70
set colorcolumn=70

" Auto Commands
autocmd BufWritePre * :%s/\s\+$//e

" Normal Mode Mappings

" define new normal mode mapping
nnoremap <leader>nnvm zzo"<esc>o<esc>xinnoremap <\leader><esc>7hx$a

" duplicate current line
nnoremap <leader>dl 0Vy<esc>p

" new public class method
nnoremap <leader>ncm 0opublic function (): void<esc>o{<esc>o}<esc>kk0wwi

" new private class method
nnoremap <leader>npcm 0oprivate function (): void<esc>o{<esc>o}<esc>kk0wwi

" new protected class method | n(ew)s(afe)c(lass)m(ethod)
nnoremap <leader>nscm 0oprotected function (): void<esc>o{<esc>o}<esc>kk0wwi

" edit $MYVIMRC
nnoremap <leader>ev :tabe $MYVIMRC<cr>

" source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" Enter command mode, and begin a call to read !, the
" output of whatever command is then entered will be
" inserted into the current file on the line below
" the line the cursor is currently on.
nnoremap <leader>iso :read !

" List buffers
nnoremap <leader>lb :ls<cr>

" List changes
nnoremap <leader>lc :changes<cr>

" List registers
nnoremap <leader>lr :registers<cr>

" Save changes.
nnoremap <leader>s :write<cr>

" Reset undo history | !BROKEN_MAPPING
" nnoremap <leader>ru :set undoreload=0 | edit %<cr>

" Find the next function or method definition
nnoremap <leader>fnf $/function.*(<cr>zz0

" Find next occurrence of word under cursor
nnoremap <leader>fw lbvey/<c-r>0<cr>

