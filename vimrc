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

  " set esc keys to timeout faster
  set ttimeoutlen=100

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

  " Wild Settings
  " Disable output and VCS files
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

  " Disable archive files
  set wildignore+=8.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

  " Ignore bundler and sass cache
  set wildignore+=*/vendor//gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

  " Disable temp and backup files
  set wildignore+=*.swp,*~,._*

  " Backup and swap files
  set backupdir^=~/.vim/_backup//         " where to put backup files.
  set directory^=~/.vim/_temp//           " where to put swap files.

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
  Plugin 'tpope/vim-fugitive'                  " Git integration
  Plugin 'airblade/vim-gitgutter'              " Git changes in the gutter
  Plugin 'elzr/vim-json'                       " Better JSON highlighting
  Plugin 'jeetsukumaran/vim-buffergator'       " Buffer management
  Plugin 'terryma/vim-multiple-cursors'        " Sublime like multiple selections
  Plugin 'bronson/vim-trailing-whitespace'     " Highlight trailig whitespaces
  " SnipMate

  " status bar
  Plugin 'vim-airline/vim-airline'             " Better status/tabline
  Plugin 'vim-airline/vim-airline-themes'      " More colorschemes

  " javascript
  Plugin 'ternjs/tern_for_vim'                 " tern plugin for vim
  Plugin 'moll/vim-node'                       " better node.js development
  Plugin 'pangloss/vim-javascript'             " improved javascript indention and syntax
  Plugin 'mxw/vim-jsx'                         " React JSX syntax highlighting and indenting
  Plugin 'othree/yajs.vim'                     " Yet Another Javascript Syntax
  Plugin 'othree/es.next.syntax.vim'           " ES.Next syntax
  Plugin 'isRuslan/vim-es6'                    " Snippets for es6
  " vim-flow
  " vim-js-indent
  " typescript-vim
  " yats.vim

  " movement
  Plugin 'matze/vim-move'                      " Move lines and selections up and down
  Plugin 'justinmk/vim-sneak'                  " Easier movement in vim
  Plugin 'prendradjaja/vim-vertigo'            " Better way to move vertically

  " code display
  Plugin 'luochen1990/rainbow'                 " rainbow parentheses
  Plugin 'Valloric/MatchTagAlways'             " highlight enclosing html/xml tags
  " vim-indent-guides

  " autocomplete
  Plugin 'Raimondi/delimitMate'                " auto-completion of quotes, parens, brackets
  Plugin 'tpope/vim-surround'                  " Easy way to add parentheses, brackets, quotes, etc.
  Plugin 'tpope/vim-endwise'                   " wisely add end to ruby and vimscripts
  Plugin 'Valloric/YouCompleteMe'              " Code completion engine
  Plugin 'SirVer/ultisnips'                    " Ultimate snippets solution
  Plugin 'alvan/vim-closetag'                  " Auto close xml/html tags

  " extras
  Plugin 'tpope/vim-vinegar'                   " Easier file browser
  Plugin 'qpkorr/vim-bufkill'                  " Kill buffer without closing window
  Plugin 'edkolev/tmuxline.vim'                " vim-airline but in tmux
  Plugin 'pbrisbin/vim-mkdir'                  " Automatically create non-existent directories
  " vim-eunuch
  " vim-fetch
  " vim-hardtime

  " colorscheme
  Plugin 'joshdick/airline-onedark.vim'        " onedark airline theme
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

    " vim-airline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'onedark'

    " vim-move
    let g:move_key_modifier = 'C'

    " YouCompleteMe
    set completeopt-=preview
    let g:ycm_register_as_syntastic_checker = 0
    let g:ycm_add_preview_to_completeopt = 0
    if !exists("g:ycm_semantic_triggers")
      let g:ycm_semantic_triggers = {}
    endif

    " YCM compatible with UltiSnips (using SuperTab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger='<tab>'
    let g:UltiSnipsJumpForwardTrigger='<C-l>'
    let g:UltiSnipsJumpBackwardTrigger='<C-h>'

    " vim-sneak
    "replace 'f' with 1-char Sneak
    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T
    hi link SneakPluginTarget ErrorMsg

    " vim-vertigo
    nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
    vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
    onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
    nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
    vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
    onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>

    " rainbow brackets
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['darkblue', 'darkyellow', 'red', 'darkgreen', 'darkmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'javascript': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
    \       },
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
    nmap <Leader>rp :RainbowToggle<CR>

    " tmuxline
    let g:tmuxline_preset = {
      \'a'            : '#S:#I',
      \'b'            : '#W',
      \'c disabled'   : '',
      \'win'          : ['#I', '#W'],
      \'cwin'         : ['#I', '#W'],
      \'y'            : ['%a', '%Y-%m-%d', '%H:%M'],
      \'z'            : ['#(whoami)']}

  "}}}

"}}}
