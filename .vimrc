"""" basics
set number
set wrap
set wildmenu
set lazyredraw
set showmatch
set scrolloff=5 " give space when scrolling above and below
set mouse=a

"""" syntax highlighting
syntax enable
filetype plugin indent on

"""" remaps
:nnoremap <C-d> <C-d>zz
:nnoremap <C-u> <C-u>zz

"""" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent

"""" search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set ignorecase          " needed for smartcase
set smartcase           " search case insensitive unless contains Uppercase letter

"""" miscellaneous
set background=dark
set clipboard=unnamed
