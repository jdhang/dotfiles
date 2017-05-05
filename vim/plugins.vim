call plug#begin('~/.vim/plugged')

Plugin 'cookieengineer/vim-explorer'
" Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mxw/vim-jsx'
Plug 'jdhang/vim-mustache-handlebars'

Plug 'tpope/vim-vinegar'

Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'edkolev/tmuxline.vim'
Plug 'w0rp/ale'

call plug#end()
