" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <C-f> :Ack<Space>

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" vim-mustache-handlebars
let g:mustache_abbreviations = 1

" vim-jsx
let g:jsx_ext_required = 0

" delimitMate
au FileType xml,html,phtml,php,xhtml,js,jsx let b:delimitMate_matchpairs = "(:),[:],{:}"

" deoplete
let g:deoplete#enable_at_startup = 1

" NERDCommenter
let g:NERDSpaceDelims = 1 " add space after each comment
map <C-_> <plug>NERDCommenterToggle<CR>
