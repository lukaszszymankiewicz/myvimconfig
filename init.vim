call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'                                       " python completion
Plug 'preservim/nerdtree'                                         " file explorer
Plug 'sainnhe/gruvbox-material'                                   " colors!
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " completion
Plug 'zchee/deoplete-jedi'                                        " completion
Plug 'yuttie/comfortable-motion.vim'                              " c00l scrolling
Plug 'w0rp/ale'
Plug 'vim-python/python-syntax'                                   " c00l syntax higlighting for python
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy find

call plug#end()

""""""""""""
" VIM UTIL "
""""""""""""
set number 
set encoding=utf-8 
set colorcolumn=100 
set splitright 
set exrc
set secure

""""""""""
" PYTHON "
""""""""""
let g:python3_host_prog = '/usr/bin/python3'
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set autoindent
set fileformat=unix
set clipboard=unnamedplus
syntax on

"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
let NERDTreeIgnore = ['__pycache__', '\.pyc$']
let g:python_highlight_all = 1
let g:deoplete#enable_at_startup = 1

let g:jedi#environment_path = "venv"
let g:jedi#show_call_signatures = "1" 
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 1

let g:ale_linters = { 'c': ['clangd'], 'python': ['black', 'flake8'] }
let g:ale_fixers = { 'python': ['black'] }
let g:ale_fix_on_save = 0 
let g:ale_linters_explicit = 1

au BufWrite *.py :ALEFix

"""""""""""""""""""""
" USER KEY SETTINGS "
"""""""""""""""""""""
let mapleader = " "
com! Json %!python3 -m json.tool

nnoremap <c-z> <nop>  
inoremap <c-c> <ESC>

nnoremap n nzzzv 
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap Y y$

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>b oimport pdb;pdb.set_trace()<Esc>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>p :NERDTreeToggle<CR> 
nnoremap <leader><leader> :noh<CR>

nnoremap <F5> :so $MYVIMRC<CR>
nnoremap <F6> :vsplit <bar> terminal python %<CR>
nnoremap <F8> :%!python -m json.tool <CR>
nnoremap <F10> :vsplit <bar> terminal gcc % -lm -o temp.o && ./temp.o %<CR>

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc> :update<CR>

"""""""""""""""
" STATUS LINE "
"""""""""""""""
set statusline= 
set statusline+=\ %f

""""""""""""""
" COMPLETION "
""""""""""""""
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<CR>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd FileType python setlocal completeopt-=preview
set shortmess=at

""""""""""
" COLORS "
"""""""""" 
set termguicolors
set background=dark
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material
