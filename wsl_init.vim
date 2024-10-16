call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'                                         " file explorer
Plug 'sainnhe/everforest'                                         " colors
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " completion
Plug 'zchee/deoplete-jedi'                                        " Python completion
Plug 'davidhalter/jedi-vim'                                       " Python LSP
Plug 'vim-python/python-syntax'                                   " Python syntax higlighting
Plug 'w0rp/ale'                                                   " lint/fix
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy find
Plug 'ervandew/supertab'                                          " better tab
" Plug 'petobens/poet-v'
Plug 'tpope/vim-surround'

call plug#end()

""""""""""""
" VIM UTIL "
""""""""""""
set number 
set encoding=utf-8 
set colorcolumn=80
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
set switchbuf+=newtab

syntax on

"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
let NERDTreeIgnore = ['__pycache__', '\.pyc$']
let NERDTreeWinPos = 0

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:python_highlight_all = 1

let g:deoplete#enable_at_startup = 1

let g:jedi#goto_assignments_command = "<leader>x"
let g:jedi#show_call_signatures = "1" 
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0

" let g:poetv_executables = ['poetry']
" let g:poetv_auto_activate = 1
" let g:poetv_set_environment = 1

" let g:ale_linters = {'python': ['flake8']}

let g:ale_linters_explicit = 1
let g:ale_virtualtext_cursor = 'disabled' 
let g:ale_set_highlights = 1
let g:ale_sign_column_always = 1
let g:ale_list_window_size = 5
let g:ale_linters = {'python': ['flake8'], 'c': ['clang', 'clangd']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 0 
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1

"""""""""""""""""""""
" USER KEY SETTINGS "
"""""""""""""""""""""
let mapleader = " "

nnoremap <c-z> <nop>  
inoremap <c-c> <ESC>

nnoremap n nzzzv 
nnoremap N Nzzzv
nnoremap Y y$

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>q :tabc<CR>

inoremap <C-b> breakpoint()
inoremap <C-z> <Esc>mz$p'z
nnoremap <C-z> mz$p'z

nnoremap <leader>b obreakpoint()<Esc><CR>==
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>t :tabo<CR> :cclose<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>p :NERDTreeToggle<CR> 
nnoremap <leader>- df_

nnoremap <leader><leader> :noh <CR>

nnoremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
nnoremap <silent> <C-F> :ALEFix<CR>
inoremap <silent> <C-S> <Esc> :update<CR>

nmap <silent> * *``
nmap <silent> # #``

nmap <silent> <leader>[ <Plug>(ale_previous_wrap)zz
nmap <silent> <leader>] <Plug>(ale_next_wrap)zz

nnoremap <F6> :vsplit <bar> terminal python %<CR>
nnoremap <leader>m :vsplit <bar> terminal <CR>

"""""""""""""""
" STATUS LINE "
"""""""""""""""
set statusline= 
set statusline+=\ %f

""""""""""""""
" COMPLETION "
""""""""""""""
autocmd FileType python setlocal completeopt = "menu, preview"
autocmd FileType c setlocal completeopt-=preview

set shortmess=at

""""""""""
" COLORS "
"""""""""" 
set termguicolors
set background=dark

let g:everforest_background = 'hard'

colorscheme everforest
highlight ALEWarning ctermbg=DarkMagenta

"""""""""""""
" CLIPBOARD "
"""""""""""""

" this allows to use same clipboard as Windows inside WSL eviroment
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
    endif

"""""""""""""""""""
" CUSTOM COMMANDS "
"""""""""""""""""""
" open search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent grep! -rIn --exclude-dir=".git" --exclude-dir="docs" --exclude-dir=".mypy_cache" --exclude-dir=".pytest_cache" --exclude-dir=".venv" --exclude "*.{pyc, json, svg}" . -e <args>' | copen | execute 'silent /<args>'

" grep current word
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>:noh<cr>

" grep current word
:nmap gs vib:s/(/(\r/g <cr> Bvib:s/)/\r)/g <cr> Bvib:s/,/,\r/g <cr> Bvib== <cr>

" copy path to current python class/function to clipboard
nnoremap <leader>im :let @a="from " . expand("%") . " import "  <CR> :let @a=substitute(@a, '/', '.', 'g') <CR> :let @a=substitute(@a, '\.py', '', 'g') <CR> b"Ayw :let @"=@a <CR>

" copy unit-test path to clipboard
nnoremap <leader>y :let @a="poetry run pytest " . expand("%") . "::" <CR> 0/test//gc <CR> h"Ayt( :let @"=@a <CR> :noh<CR>b
