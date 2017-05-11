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

" status lines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" syntax
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

Plug 'w0rp/ale'

call plug#end()
