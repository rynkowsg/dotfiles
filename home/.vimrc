""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Based on:
""  * https://github.com/amix/vimrc/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" " (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

" Show row and column ruler information
set ruler

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" http://vim.wikia.com/wiki/Backspace_and_delete_problems

"" Automatically wrap left and right
"set whichwrap+=<,>,h,l,[,]
"" http://vim.wikia.com/wiki/Automatically_wrap_left_and_right

"" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Add a bit extra margin to the left
set foldcolumn=0

" Turn line numbers on
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding
set encoding=utf-8      " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linebreak on 500 characters
set linebreak       " Enable linebreak
set textwidth=500   " Set width of text
set wrap            " Wrap lines

" Tabs
set expandtab       " Use spaces instead of tabs
set smarttab        " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab
set tabstop=2       "

" Indent
set autoindent      " Auto-indent new lines
set shiftwidth=2    " Number of auto-indent spaces
set smartindent     " Enable smart-indent - Be smart when using tabs ;)


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=1

