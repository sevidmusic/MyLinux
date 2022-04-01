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

" Auto Commands
autocmd BufWritePre * :%s/\s\+$//e

" Normal Mode Mappings

" define new normal mode mapping
nnoremap <leader>nnvm onnoremap

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

