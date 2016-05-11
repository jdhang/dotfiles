" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible " required by vundle
filetype off     " required by vundle

" sets runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Define bundles via Github repos
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ddollar/nerdcommenter'
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'sickill/vim-pasta'
Plugin 'vim-scripts/matchit.zip'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'

" Language syntax
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'

" javascript plugins
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'

" color schemes
Plugin 'chriskempson/base16-vim'
Plugin 'joshdick/onedark.vim'

" All plugins must be added before this line
call vundle#end()             " required
filetype plugin indent on     " required

" Color scheme
set t_Co=256
set background=dark
colorscheme onedark

" Leader
let mapleader = ","

" Enable built-in matchit plugin
runtime macros/matchit.vim

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" set line highlighting
set cursorline

" relative numbering
set relativenumber

" Numbers
set number
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diff
set diffopt+=vertical

" All Plugin Settings Below

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1
au BufNewFile,BufFilePre,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['eslint']

" ctrlp settings
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'top,min:1,max:10'

" jsx highlighting in js files as well
let g:jsx_ext_required = 0

" enable html/css highlighting in js file
let g:javascript_enable_domhtmlcss = 1

" config javascript lib syntax
let g:used_javascript_libs = 'underscore,backbone,jquery,react,flux,jasmine,chai,handlebars,angularjs'

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" NERDCommenter, add space after each comment
let g:NERDSpaceDelims = 1

" personal remaps below
map <Leader>bi :!bundle install<CR>
map <Leader>bb :PluginInstall<CR>
" map <Leader>w <C-w>w
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :CtrlPBuffer<CR>

command! Q q
command! Qall qall
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>

" edit files and split windows easier
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') .  '/'<CR>
map <Leader>sp :split
map <Leader>vp :vsplit
