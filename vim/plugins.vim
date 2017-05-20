call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/nerdtree'

" base
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'

" status lines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'jdhang/vim-mustache-handlebars'

" dir
Plug 'tpope/vim-vinegar'

" movement
Plug 'justinmk/vim-sneak'

" autocomplete
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" linting
Plug 'w0rp/ale'

" colorschemes
Plug 'chriskempson/base16-vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ajh17/Spacegray.vim'

call plug#end()
