"------------------Colors and colorschemes----------------------
if has("gui_running")
  set background=dark
  colorscheme solarized
else
  colorscheme wombat256mod
  autocmd ColorScheme * highlight NonText guifg=#e3e0d7	guibg=#242424
endif

" Change declared colors in colorscheme for popup menu
"highlight Pmenu guibg=#444D45
"highlight PmenuSel guibg=#C0C700
"highlight PmenuSel guifg=#2F3630
"---------------------------------------------------------------

"-----------Primary settings------------------------------------
" Turn off compatibility mode  VI:
set nocompatible

"Pathogen init
call pathogen#infect()

" Incremental search
set ignorecase
set smartcase
set incsearch
set hlsearch

set ruler
set cursorline

set showmode
set showcmd

set wildmenu

filetype plugin indent on

" TABs settings
set tabstop=2
set shiftwidth=2
set smarttab
" TABs as SPACEs
set expandtab 
set softtabstop=2

set autoindent
set smartindent

" Ignore caps
set ic

let python_highlight_all = 1

" 256 colors in terminal
set t_Co=256

syntax on 
set nu 
set mouse=a 
set termencoding=utf-8 
set novisualbell 
set backspace=indent,eol,start whichwrap+=<,>,[,]
set showtabline=0
" Show plus_button to show/close code blocks
set foldcolumn=1

set wrap
set linebreak

" Make scrolling faster
set lazyredraw

" Disable backup/swap files
set nobackup
set noswapfile

" Default encoding
set encoding=utf-8
" Fallback encoding
set fileencodings=utf8,cp1251

" Cut spaces in the end of .py files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Smart indent in .py files
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Embedded javascript
autocmd BufRead *.html set smartindent cinwords=if,else,for,while,function
"-------------------------------------------------------------------------------------------------


"----------------------Plugins setting---------------------------
" Enable cool NERDTREE plugin
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd l

let g:neocomplcache_enable_at_startup = 1

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

set completeopt+=longest

" Add fuzzy file open feature
set runtimepath^=~/.vim/bundle/ctrlp.vim

" TagBar plugin (show tags in file, uses ctags)
autocmd VimEnter * Tagbar
nmap <F8> :TagbarToggle<CR>
"----------------------------------------------------------------

"----------------Shortcut settings-------------------------------
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
noremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Shift+Arrow will navigate through open tabs
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

" Shortcuts to horizontal/vertical window split
nmap <silent> <Bar> :vs <CR>
nmap <silent> <C-Bslash> :split <CR>

" Maximize current window
nmap <silent> <S-m> :wincmd _<CR> 
" Make windows equal size
nmap <silent> <A-m> :wincmd =<CR>

nmap <silent> <S-z><q> :q! <CR>

" Disable shift+q annoying visual mode
nmap <silent> <S-q> :nop

" Unset the "last search pattern" register by hitting return
noremap <CR> :noh<CR><CR>

" Run .py files in VIM
imap <special><F5> <ESC>:w\|!python %<CR>
nmap <F5> :w\|!python %<CR>

inoremap jj <Esc>
"--------------------------------------------------------------
