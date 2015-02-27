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
Plugin 'wincent/Command-T'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'danro/rename.vim'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/tComment'
Plugin 'vim-scripts/ZoomWin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sickill/vim-pasta'
Plugin 'vim-scripts/matchit.zip'

" Language syntax
Plugin 'thoughtbot/vim-rspec'
Plugin 'plasticboy/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-haml'
Plugin 'lunaru/vim-less'

" Ruby/Rails
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" javascript plugins
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'

" color schemes
Plugin 'tomasr/molokai'

" nelstrom's plugin depends on kana's
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" All plugins must be added before this line
call vundle#end()             " required
filetype plugin indent on     " required

" Color scheme
set t_Co=256
colorscheme molokai

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
set wrap

" Numbers
set number
set numberwidth=5

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
let g:rspec_command = "!bundle exec rspec -c {spec}"
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>o :w<CR>:call RunNearestSpec()<CR>
nnoremap <Leader>p :w<CR>:call RunCurrentSpecFile()<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_ruby_checkers = ['mir', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint']

" Always use vertical diffs
set diffopt+=vertical

" Multiple Cursor Bindings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

" command-t settings
let g:CommandTMaxHeight=20
let g:CommandTCancellMap=['<C-c>', '<Esc>']
noremap <leader>f :CommandTFlush<CR>

" personal remaps
map <Leader>bi :!bundle install<CR>
map <Leader>bb :PluginInstall<CR>
map <Leader>h :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>c :Rcontroller
map <Leader>sc :RScontroller
map <Leader>vc :RVcontroller
map <Leader>u :Runittest
map <Leader>su :RSunittest
map <Leader>vu :RVunittest
map <Leader>m :Rmodel
map <Leader>sm :RSmodel
map <Leader>vm :RVmodel
map <Leader>v :Rview
map <Leader>sv :RSview
map <Leader>vv :RVview
map <Leader>s :Rspec
map <Leader>ss :RSspec
map <Leader>vs :RVspec
map <Leader>rg :!rails g
map <Leader>dm :!bundle exec rake db:migrate<CR>
map <Leader>dt :!bundle exec rake db:migrate RAILS_ENV=test<CR>
map <Leader>dd :!bundle exec rake db:drop db:create<CR>
map <Leader>dr :!bundle exec rake db:reset<CR>
map <Leader>w <C-w>w
map <Leader>zw :ZoomWin<CR>
map <C-n> :NERDTreeToggle<CR>

command! Q q
command! Qall qall
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
inoremap {<CR>  {<CR>}<Esc>O

" edit files and split windows easier
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') .  '/'<CR>
map <Leader>sp :split
map <Leader>vp :vsplit
