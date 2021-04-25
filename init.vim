"""""""""""""
" REMINDERS "
"""""""""""""
" PlguInstall - to install new plugins
" PlugClean - to clean unused plugins

"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')

Plug 'roxma/nvim-yarp'                                            " async completion 
Plug 'ncm2/ncm2'                                                  " completion system
Plug 'HansPinckaers/ncm2-jedi'                                    " python completion
Plug 'ncm2/ncm2-bufword'                                          " buffer completion
Plug 'ncm2/ncm2-path'                                             " files names/path completion
Plug 'davidhalter/jedi-vim'                                       " python completion

Plug 'preservim/nerdtree'                                         " file explorer
Plug 'sainnhe/gruvbox-material'                                   " colors!
Plug 'dense-analysis/ale'                                         " syntax/linters/fixers
Plug 'yuttie/comfortable-motion.vim'                              " c00l scrolling
Plug 'vim-python/python-syntax'                                   " c00l syntax higlighting for python
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy find

call plug#end()

""""""""""""
" VIM UTIL "
""""""""""""
set number "line numbers on
set encoding=utf-8 "default encoding
set colorcolumn=100 "ruler
set splitright "vertical split always on right side

""""""""""
" PYTHON "
""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set autoindent
set fileformat=unix
set clipboard=unnamedplus
syntax on

"""""""""""""""""""""""
" PLUGIN KEY BIDDINGS "
"""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR> 
nnoremap <silent> <leader>f :FZF<cr>

"""""""""""""""""""""""
" PLUGIN KEY SETTINGS "
"""""""""""""""""""""""
let NERDTreeIgnore = ['__pycache__', '\.pyc$']
let g:python_highlight_all = 1
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif "close func param window

"""""""""""""""""""""
" USER KEY SETTINGS "
"""""""""""""""""""""
com! Json %!python -m json.tool
nnoremap <c-z> <nop>  
nnoremap <Leader>b oimport pdb;pdb.set_trace()<Esc>
nnoremap <F6> :vsplit <bar> terminal python %<CR>
nnoremap <F5> :so $MYVIMRC<CR>
nnoremap <F8> :%!python -m json.tool <CR>
nnoremap <F10> :vsplit <bar> terminal gcc % -lm -o temp.o && ./temp.o %<CR>
nnoremap <C-i> :tabnext <CR>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc> :update<CR>

"""""""""""""""
" STATUS LINE "
"""""""""""""""
set statusline= 
set statusline=%F
set guitablabel=%f

""""""""
" NCM2 "
""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
inoremap <c-c> <ESC>

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'
set shortmess+=c

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""""""""
" JEDI "
""""""""
let g:jedi#show_call_signatures = "1" 
let g:jedi#popup_on_dot = 0
" let g:jedi#auto_initialization = 0 
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#completions_command = ""

""""""""""
" COLORS "
"""""""""" 
set termguicolors
set background=dark
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material
