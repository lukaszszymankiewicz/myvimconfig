call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/goyo.vim'

call plug#end()

""""""""""""
" VIM UTIL "
""""""""""""
set encoding=utf-8 
set clipboard=unnamedplus
set formatoptions+=w
set wrap linebreak
set tw=0

"""""""""""""""""""""
" USER KEY SETTINGS "
"""""""""""""""""""""
let mapleader = " "

nnoremap <c-z> <nop>  
inoremap <c-c> <ESC>

nnoremap <leader>p :NERDTreeToggle<CR> 
nnoremap <leader><leader> :noh<CR>

nnoremap <F5> :so $MYVIMRC<CR>
nnoremap <F7> :so ~/.config/nvim/writing_init.vim<CR>

noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc> :update<CR>

"""""""""""""""
" STATUS LINE "
"""""""""""""""
set statusline= 
set statusline+=\ %f

""""""""""
" COLORS "
"""""""""" 
set termguicolors
set background=dark
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material
