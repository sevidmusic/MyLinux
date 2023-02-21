" Settings

" Prevent vim from asking if you want to save everytime you leave
" a modified buffer.
set hidden

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

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Normal Mode Mappings

" Enable/disable cursorline and cursorcolumn
:nnoremap <leader>c :set cursorline! cursorcolumn!<cr>

" Enable/disable spellcheck
:nnoremap <leader>sc :set spell!<cr>

" Enable/disable line numbers and relative line numbers
:nnoremap <leader>ln :set number! relativenumber!<cr>

" define new normal mode mapping
nnoremap <leader>nnvm zzo"<esc>o<esc>xinnoremap <\leader><esc>7hx$a

" define new normal mode mapping
nnoremap <leader>nvvm zzo"<esc>o<esc>xivnoremap <\leader><esc>7hx$a

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

" new php method/function doc comment
nnoremap <leader>mcm o/**<esc>o<esc>o/<esc>khxxxa [Description]<esc>o<esc>o@return<esc>o<esc>o@example<esc>o<esc>o```<esc><esc>o<esc>o```<esc>o<esc>

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

" Find the next function or method definition
nnoremap <leader>fnf $/function.*(<cr>zz0

" Find next occurrence of word under cursor
nnoremap <leader>fw lbvey/<c-r>0<cr>

" turn a snake into a camel
nnoremap <leader>+ mmviw:s/\%V_\(.\)/\U\1/g<cr>:nohlsearch<cr>`m

" turn a camel into a snake
nnoremap <leader>_ mmviw:s/\%V\(\u\)/_\L\1/g<cr>:nohlsearch<cr>`m

" Show the methods defined by the current file by calling showMethods
" Requires the following script:
" [~/.darling/showMethods](https://github.com/sevidmusic/MyLinux/blob/PopOS/.darling/showMethods)
nnoremap <leader>sm :!showMethods %<cr>

" Print the methods defined by the current file by calling showMethods
" Requires the following script:
"
" Note: This will also sort the methods using vim's sort function.
"
" [~/.darling/showMethods](https://github.com/sevidmusic/MyLinux/blob/PopOS/.darling/showMethods)
nnoremap <leader>spm m1i/**<esc>:read !showMethods %<cr>o*/<esc>m2kdd`1jdd0V`2k:sort<cr><esc>0

" Show git status
nnoremap <leader>gst :!git status<cr>

" Show git diff
nnoremap <leader>gdf :!git diff<cr>

" Show git add all changes
nnoremap <leader>gaa :!git add . <cr><cr>:echo "added changes to git"<cr>

" View ~/.config/nvim/init.vim in a buffer
nnoremap <leader>kb :!cat ~/.config/nvim/init.vim<cr>gg

" Select the current line and all lines up to and including the
" previous occurrence of:
"
" /**
"
nnoremap <leader>spc V?\/\*\*<cr>

" Close current file
nnoremap <leader>q :q<cr>

" Close all
nnoremap <leader>qa :qa<cr>

" Write current file
nnoremap <leader>w :w<cr>

" Write all open files
nnoremap <leader>wa :wa<cr>

" Write current file and quit
nnoremap <leader>wq :wq<cr>

" Write current file and clear the undo history.
nnoremap <leader>W :w<cr>:set undoreload=0<cr>:edit<cr>

" Write all open files and clear the undo history.
nnoremap <leader>Wa :wa<cr>:set undoreload=0<cr>:edit<cr>

" Write and quit all files
nnoremap <leader>wqa :wqa<cr>

" Move to the next buffer
nnoremap <leader>nb :bnext<cr>

" Move to the previous buffer
nnoremap <leader>pb :bprevious<cr>

" Select a buffer by entering it's assigned numeric id
nnoremap <leader>sb :buffer<space>

" Enter :colorscheme prompt
nnoremap <leader>cc :colorscheme

" Begin a search for a function
nnoremap <leader>ff /function.*

" Initiate the wal loop
"
" Note, this mapping requires the following scripts:
"
" https://github.com/sevidmusic/MyLinux/blob/PopOS/.darling/loopWal
" https://github.com/sevidmusic/MyLinux/blob/PopOS/.darling/changeColors
"
nnoremap <leader>lw :!loopWal<cr>

" Visual mode mappings

" Perform a text search on the selected text
"
" The following stackoverflow post was helped me figure out
" this mapping:
"
" https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim
"
vnoremap <leader>ts y/<c-r>"<cr>

" Perform a plain text search on the selected text
"
" The following stackoverflow post was helped me figure out
" this mapping:
"
" https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim
"
vnoremap <leader>pts y/\V<c-r>"<cr>

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

" Setting that must be set after plugins

" Plugin Settings
colorscheme darling1

" Functions

let g:cschemes = ['darling1', 'afterglow', 'focuspoint', 'iceberg', 'tender', 'termschool', 'twilight256']

""""""" Cycle Through Favorite Color Schemes """""""
function! CycleColorSchemesForward()
  let current_scheme = g:colors_name
  " Uncomment to use all installed color schemes: let schemes = ['256_noir', 'OceanicNext', 'OceanicNextLight', 'PaperColor', 'abstract', 'afterglow', 'alduin', 'anderson', 'angr', 'apprentice', 'archery', 'atom', 'ayu', 'carbonized-dark', 'carbonized-light', 'challenger_deep', 'deep-space', 'deus', 'dogrun', 'fahrenheit', 'flattened_dark', 'flattened_light', 'focuspoint', 'fogbell', 'fogbell_light', 'fogbell_lite', 'github', 'gotham', 'gotham256', 'gruvbox', 'happy_hacking', 'hybrid', 'hybrid_material', 'hybrid_reverse', 'iceberg', 'jellybeans', 'lightning', 'lucid', 'lucius', 'materialbox', 'meta5', 'minimalist', 'molokai', 'molokayo', 'mountaineer', 'mountaineer-grey', 'mountaineer-light', 'nord', 'oceanic_material', 'one', 'one-dark', 'onedark', 'onehalfdark', 'onehalflight', 'orange-moon', 'orbital', 'paramount', 'parsec', 'pink-moon', 'purify', 'pyte', 'rakr', 'rdark-terminal2', 'scheakur', 'seoul256', 'seoul256-light', 'sierra', 'snow', 'solarized8', 'solarized8_flat', 'solarized8_high', 'solarized8_low', 'sonokai', 'space-vim-dark', 'spacecamp', 'spacecamp_lite', 'stellarized', 'sunbather', 'tender', 'termschool', 'twilight256', 'two-firewatch', 'wombat256mod', 'yellow-moon']
  let schemes = g:cschemes
  let index = index(schemes, current_scheme)
  let next_scheme = schemes[(index + 1) % len(schemes)]
  execute "colorscheme " . next_scheme
  echo next_scheme
endfunction

function! CycleColorSchemesBackward()
  let current_scheme = g:colors_name
  let schemes = g:cschemes
  let index = index(schemes, current_scheme)
  let next_scheme = schemes[(index - 1) % len(schemes)]
  execute "colorscheme " . next_scheme
  echo next_scheme
endfunction

" Set keybindings for function calls
nnoremap <F5> :call CycleColorSchemesBackward()<cr>
nnoremap <F6> :call CycleColorSchemesForward()<cr>

""""""" End Cycle Through Favorite Color Schemes """""""
