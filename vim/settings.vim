" color schemes
set background=dark
set t_Co=256
" colorscheme cookie
" colorscheme grb256
 colorscheme spacegray
" colorscheme base16-jason
" colorscheme base16-ashes
" colorscheme base16-chalk
" colorscheme base16-jasonV2
" colorscheme neodark
" let g:neodark#background = '#121212'
syntax enable

" file settings
filetype plugin indent on
set autoread
set path+=**
set wildmode=longest,list
set wildmenu

" window settings
set noea
set equalalways
set nolazyredraw

set ruler
set number relativenumber
set numberwidth=3
set colorcolumn=100

set laststatus=2

" backup settings
set nobackup
set nowritebackup
set noswapfile

" core settings
set nowrap
set nofoldenable
set hlsearch
set incsearch
set ignorecase smartcase
set hidden
set scrolloff=0

" cursor
set cursorline

" indenting
set autoindent
set smarttab
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2
set softtabstop=2
set backspace=indent,eol,start

" better split window
set splitbelow
set splitright

" enable mouse
set mouse=a

" list chars
set list
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.

" clipboard
set clipboard=unnamed
