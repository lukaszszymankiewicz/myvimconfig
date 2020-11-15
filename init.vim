"""""""""""""
" REMINDERS "
"""""""""""""

" PlguInstall - to install new plugins
" PlugClean - to clean unused plugins

"""""""""""
" PLUGINS "
"""""""""""

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' "file explorer
Plug 'davidhalter/jedi-vim' "python completion
Plug 'sainnhe/gruvbox-material' "colors!
Plug 'dense-analysis/ale' " syntax/linters/fixers
Plug 'yuttie/comfortable-motion.vim' "c00l scrolling
Plug 'vim-python/python-syntax' " c00l suntax higlighting for python
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy find
Plug 'ncm2/ncm2' "completion 
Plug 'roxma/nvim-yarp' "completion 
Plug 'ncm2/ncm2-bufword' "completion
Plug 'ncm2/ncm2-path' "completion
" Plug 'ncm2/ncm2-jedi' "completion (commented by now)

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
set completeopt=noinsert,menuone,noselect
syntax on

"""""""""""""""""""""""
" PLUGIN KEY BIDDINGS "
"""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR> 
nnoremap <silent> <leader>f :FZF<cr>
com! Json %!python -m json.tool

"""""""""""""""""""""""
" PLUGIN KEY SETTINGS "
"""""""""""""""""""""""
let g:python_highlight_all = 1
let g:jedi#show_call_signatures = "1" 
let NERDTreeIgnore = ['__pycache__', '\.pyc$']
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif "close func param window
autocmd BufEnter * call ncm2#enable_for_buffer()

"""""""""""""""""""""
" USER KEY SETTINGS "
"""""""""""""""""""""
nnoremap <c-z> <nop>
nnoremap <Leader>b oimport pdb;pdb.set_trace()<Esc>
nnoremap <F6> :vsplit <bar> terminal python %<CR>
nnoremap <F5> :so $MYVIMRC<CR>
nnoremap <F8> :%!python -m json.tool <CR>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> :update<CR>
nnoremap <C-i> :tabnext <CR>

"""""""""""""""
" STATUS LINE "
"""""""""""""""
set statusline= 
set statusline=%F
set statusline+=%=
set statusline+=%{strftime('%H:%M')}
set guitablabel=%f

""""""""
" NCM2 "
""""""""
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

""""""""""
" COLORS "
"""""""""" 
set termguicolors
set background=dark
let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material
