if &compatible | set nocompatible | endif

exe 'source' '~/.vim/settings.vim'
exe 'source' '~/.vim/plugins.vim'
exe 'source' '~/.vim/mappings.vim'
exe 'source' '~/.vim/syntaxes.vim'

for file in split(globpath('~/.vim/settings', 'settings.*.vim'), '\n')
  exe 'source' file
endfor

runtime macros/matchit.vim

" NeoVIM support
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  set viminfo+=n~/.vim/nviminfo
else
  set viminfo+=n~/.vim/nviminfo
endif

if has('termguicolors')
  set termguicolors
endif
