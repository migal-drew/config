if has("gui_running")
  colorscheme wombat256mod "Mellow
  set guifont=Ubuntu\ Mono\ 13
else
  colorscheme wombat256mod
endif


"Вырубаем режим совместимости с VI:
set nocompatible

"pathogen init
call pathogen#infect()


autocmd ColorScheme * highlight NonText guifg=#e3e0d7	guibg=#242424

set ttyfast

"Инкрементный поиск
set ignorecase
set smartcase
set incsearch
set hlsearch

set ruler

"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype plugin indent on

"Настройки табов для Python, согласно рекомендациям
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=2
"Автоотступ
set autoindent
set smartindent


"ignore caps
set ic
"Подсвечиваем все что можно подсвечивать
"let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

"Настройка omnicomletion
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Для embedded javascript
autocmd BufRead *.html set smartindent cinwords=if,else,for,while,function

" CTRL-X and SHIFT-Del are Cut
vnoremap <S-Del> "+x


" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
"map <C-V> "+gP
"map <S-Insert> "+gP

"cmap <C-V> <C-R>+
"cmap <S-Insert> <C-R>+

"imap <S-Insert> <C-V>
"vmap <S-Insert> <C-V>


syntax on "Включить подсветку синтаксиса
set nu "Включаем нумерацию строк
set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать 
"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
"Вырубаем черточки на табах
set showtabline=0
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

"Переносим на другую строчку, разрываем строки
set wrap
set linebreak

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
imap <special><F5> <ESC>:w\|!python %<CR>
nmap <F5> :w\|!python %<CR>

"Включаем плагин nerdtree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd l

" pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
noremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

let g:neocomplcache_enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

set completeopt+=longest
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Change declared colors in colorscheme for popup menu
highlight Pmenu guibg=#444D45
highlight PmenuSel guibg=#C0C700
highlight PmenuSel guifg=#2F3630

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" Shift + arrow will navigate through open tabs
nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>

nmap <silent> <Bar> :vs <CR>
nmap <silent> <C-Bslash> :split <CR>
syntax on "Включить подсветку синтаксиса
set nu "Включаем нумерацию строк
set mouse=a "Включить поддержку мыши

" Unset the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
