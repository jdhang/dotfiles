""" Appearance
"{{{

  " nocompatible mode
  set nocompatible

  " syntax highlighting
  syntax on

  " set color theme
  colorscheme onedark

  " line numbers
  set ruler
  set number relativenumber
  set numberwidth=5

  " make it obvious where 80 char is
  set textwidth=80
  set colorcolumn=+1

  set cursorline                          " line highlighing
  set laststatus=2                        " display status line
  set nowrap                              " don't wrap lines
  set backspace=indent,eol,start          " backspace through everything

  " indenting
  set cindent
  set expandtab
  set shiftround
  set shiftwidth=2                        " an autoindent is two spaces
  set tabstop=2                           " a tab is two spaces
  set softtabstop=2

  " better split window feel
  set splitbelow
  set splitright

  set ttimeoutlen=100                     " set esckeys to timeout faster

  " List chars
  set listchars=""                        " Reset the listchars
  set listchars=tab:\ \                   " a tab should display as " ", trailing whitespace as "."
  set listchars+=trail:.                  " show trailing spaces as dots

"}}}

""" Function Keys
"{{{

  " set paste mode
  set pastetoggle=<F2>

"}}}

""" Behavior Modifiers
"{{{

  " Key Modifiers
  "{{{

    " map leader key
    let mapleader=','

    " more robust exiting commands
    command! Q q
    command! W w
    command! Wq wq
    command! WQ wq
    command! Qall qall

    " Save using ctrl-s
    map <C-s> <esc>:w<CR>
    imap <C-s> <esc>:w<CR>

    " quicker splitting
    map <Leader>sp :split<CR>
    map <Leader>vp :vsplit<CR>

    " quicker switching of syntax
    map <Leader>ss :set syntax=

    " quicker switching of colorscheme
    map <Leader>cs :colorscheme 

    " quicker window movements
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    " buffer management
    map <Leader>bd :bd<CR>
    map <Leader>bn :bnext<CR>
    map <Leader>bv :bprevious<CR>

    " toggle background color
    map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark")<CR>

    " Toggle highlight
    nmap <Leader>hs :set hlsearch! hlsearch?<CR>

  "}}}

"}}}

""" Auto Modifiers
"{{{

  " search settings
  set ignorecase
  set incsearch
  set smartcase
  set scrolloff=10
  set hlsearch!

  " spelling
  setlocal spell spelllang=en
  nmap ss :set spell!<CR>
  set nospell
  autocmd FileType gitcommit setlocal spell

"}}}

""" Plugins
"{{{

  filetype off

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'                " Let Vundle manage Vundle

  " janus base
  Plugin 'mileszs/ack.vim'                     " File searching
  Plugin 'kien/ctrlp.vim'                      " File searching
  Plugin 'scrooloose/nerdcommenter'            " Quick commenter
  Plugin 'scrooloose/nerdtree'                 " File tree browser
  Plugin 'Xuyuanp/nerdtree-git-plugin'         " Git for NERDTree
  Plugin 'ervandew/supertab'                   " Insert completions
  Plugin 'scrooloose/syntastic'                " Syntax checking
  " SnipMate
  Plugin 'tpope/vim-fugitive'                  " Git integration
  Plugin 'airblade/vim-gitgutter'              " Git changes in the gutter
  Plugin 'elzr/vim-json'                       " Better JSON highlighting
  Plugin 'jeetsukumaran/vim-buffergator'       " Buffer management
  Plugin 'terryma/vim-multiple-cursors'        " Sublime like multiple selections
  Plugin 'bronson/vim-trailing-whitespace'     " Highlight trailig whitespaces

  " status bar
  Plugin 'vim-airline/vim-airline'             " Better status/tabline
  Plugin 'vim-airline/vim-airline-themes'      " More colorschemes

  " javascript
  " tern_for_vim
  Plugin 'moll/vim-node'                       " better node.js development
  Plugin 'pangloss/vim-javascript'             " improved javascript indention and syntax
  " vim-js-indent
  Plugin 'mxw/vim-jsx'                         " React JSX syntax highlighting and indenting
  " vim-flow
  " vim-es6
  Plugin 'othree/yajs.vim'                     " Yet Another Javascript Syntax
  Plugin 'othree/es.next.syntax.vim'           " ES.Next syntax
  Plugin 'isRuslan/vim-es6'                    " Snippets for es6
  " typescript-vim
  " yats.vim

  " movement
  Plugin 'matze/vim-move'                      " Move lines and selections up and down
  " vim-sneak
  " vim-vertigo

  " code display
  " rainbow
  " vim-indent-guides

  " autocomplete
  " vim-surround
  " vim-endwise
  Plugin 'Valloric/YouCompleteMe'              " Code completion engine
  " ultisnips
  " vim-closetag
  " MatchTagAlways

  " extras
  Plugin 'tpope/vim-vinegar'                   " Easier file browser
  " vim-bufkill
  " vim-eunuch
  " vim-hardtime
  " tmuxline.vim
  " vim-mkdir
  " vim-fetch

  " colorscheme
  " vim-deep-space
  " papercolor-theme

  call vundle#end()
  filetype plugin indent on

  " Plugin Configuration
  "{{{

    " Ack
    " ctrl-f
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
    nnoremap <C-f> :Ack 

    " CtrlP
    let g:ctrlp_match_window = 'top'

    " NERDCommenter
    let g:NERDSpaceDelims = 1 " add space after each comment

    " NERDTree
    nnoremap <Leader>n :NERDTreeToggle<CR>

    " Syntastic
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
    let g:syntastic_javascript_checkers = ['jshint', 'eslint']

    " Fugitive
    nnoremap <Leader>gb :Gblame<CR>
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>gl :Glog<CR>
    nnoremap <Leader>gc :Gcommit<CR>
    nnoremap <Leader>gp :Git push<CR>

    " vim-trailing-whitespaces

    " vim-airline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'onedark'

    " vim-move
    let g:move_key_modifer = 'C'

    " rainbow brackets
    " autocmd VimEnter * RainbowParenthesesToggle
    " autocmd Syntax * RainbowParenthesesLoadRound
    " autocmd Syntax * RainbowParenthesesLoadSquare
    " autocmd Syntax * RainbowParenthesesLoadBraces

  "}}}

"}}}
