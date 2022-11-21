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

set cursorline

set cursorcolumn

" Auto Commands
autocmd BufWritePre * :%s/\s\+$//e

" Normal Mode Mappings

" Enable/disable cursorline and cursorcolumn
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Enable/disable spellcheck
:nnoremap <Leader>sc :set spell!<CR>

" Enable/disable line numbers and relative line numbers
:nnoremap <Leader>ln :set number! relativenumber!<CR>

" define new normal mode mapping
nnoremap <leader>nnvm zzo"<esc>o<esc>xinnoremap <\leader><esc>7hx$a

" duplicate current line
nnoremap <leader>dl 0Vy<esc>p

" new public class method
nnoremap <leader>ncm 0opublic function (): void<esc>o{<esc>o}<esc>kk0wwwi

" new protected class method
nnoremap <leader>npm 0oprotected function (): void<esc>o{<esc>o}<esc>kk0wwwi

" new private class method
nnoremap <leader>nsm 0oprivate function (): void<esc>o{<esc>o}<esc>kk0wwwi

" new php doc comment
nnoremap <leader>dcm o/**<esc>o<esc>o/<esc>khxxxa

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

" Find the next function or method definition
nnoremap <leader>fnf $/function.*(<cr>zz0

" Find next occurrence of word under cursor
nnoremap <leader>fw lbvey/<c-r>0<cr>

" turn a snake into a camel
nnoremap <Leader>+ mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m

" turn a camel into a snake
nnoremap <Leader>_ mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" Show the methods defined by the current file by calling showMethods
" Requires the following script:
" [~/.darling/showMethods](https://github.com/sevidmusic/MyLinux/blob/PopOS/.darling/showMethods)
nnoremap <leader>sm :!showMethods %<cr>

" Print the methods defined by the current file by calling showMethods
" Requires the following script:
" [~/.darling/showMethods](https://github.com/sevidmusic/MyLinux/blob/PopOS/.darling/showMethods)
nnoremap <leader>spm :read !showMethods %<cr>

" Show git status
nnoremap <leader>gst :!git status<cr>

" Plugins

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin()

" Third party color schemes
Plug 'fcpg/vim-fahrenheit'

" File system plugins
Plug 'preservim/nerdtree'

" Code Snippet plugin.
Plug 'SirVer/ultisnips'

" Snippets for the Snippet plugin:
Plug 'honza/vim-snippets'

" Linter plugin
Plug 'dense-analysis/ale'

" Better status bar. vim-airline
Plug 'vim-airline/vim-airline'

" Themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Theme repo with a variety of themes
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" Plugin Mappings
" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>

" Plugin Settings
colorscheme jellybeans

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:ultisnips_php_scalar_types = 1

" ALE settings
" Allow ALE to show status via vim-airline
let g:airline#extensions#ale#enabled = 1

" vim-ariline settings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
