call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'                                         " file explorer
Plug 'sainnhe/gruvbox-material'                                   " colorsheme
Plug 'davidhalter/jedi-vim'                                       " Python completion
Plug 'vim-python/python-syntax'                                   " Python syntax higlighting
Plug 'w0rp/ale'                                                   " code linting/fixing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy find

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " completion
Plug 'zchee/deoplete-jedi'                                        " Python completion

call plug#end()

""""""""""""
" VIM UTIL "
""""""""""""
set number 
set encoding=utf-8 
set colorcolumn=79 
set splitright 
set signcolumn=yes:1

""""""""""
" PYTHON "
""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set expandtab
set autoindent
set fileformat=unix
set clipboard=unnamedplus

syntax on

"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
let NERDTreeIgnore = ['__pycache__', '\.pyc$']
let NERDTreeWinPos = 0

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:python_highlight_all = 1

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete = 1
" let g:jedi#show_call_signatures = "1" 
let g:jedi#completions_enabled = 1

let g:jedi#environment_path = "venv"
let g:jedi#show_call_signatures = 2 
let g:jedi#popup_select_first = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0

let g:ale_virtualtext_cursor = 'disabled'
let g:ale_linters = { 'c': ['clangd'], 'python': ['black', 'flake8'] }
let g:ale_fixers = { 'python': ['black', 'isort'] }
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 1
let g:ale_sign_column_always = 1
let g:ale_list_window_size = 5
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 0 

"""""""""""""""""""""
" USER KEY SETTINGS "
"""""""""""""""""""""
let mapleader = " "

nnoremap <c-z> <nop>  
inoremap <c-c> <ESC>

nnoremap n nzzzv 
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap Y y$

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" tabs manipulation
nnoremap <leader>q :tabc<CR>
nnoremap <leader>t :tabo<CR> :cclose<CR>

nnoremap <leader>b obreakpoint()<Esc><CR>==
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>p :NERDTreeToggle<CR> 
nnoremap <leader><leader> :noh<CR>
nnoremap <leader>q <C-w>p

nnoremap <F6> :vsplit <bar> terminal python %<CR>

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <Esc> :update<CR>

nmap <silent> <leader>[ <Plug>(ale_previous_wrap)zz
nmap <silent> <leader>] <Plug>(ale_next_wrap)zz

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
nnoremap <silent> <C-F> :ALEFix<CR>

autocmd FileType python setlocal completeopt-=preview
autocmd FileType c setlocal completeopt-=preview

set completeopt-=preview
set shortmess=at

""""""""""
" COLORS "
"""""""""" 

" transparent background (effect inherited directly from the terminal window)
augroup user_colors
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
augroup END

colorscheme gruvbox-material

"""""""""""""""""""
" CUSTOM COMMANDS "
"""""""""""""""""""
" opens search results in a window w/ links and highlight the matches
" TODO: refactor it
" check why it call vimgrep, maybe some plugin will help here?
command! -nargs=+ Grep execute 'silent grep! -rIn . -e <args>' | copen | execute 'silent /<args>'

" shift-control-* Greps for the word under the cursor
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>:noh<cr>
