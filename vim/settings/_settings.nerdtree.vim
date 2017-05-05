" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let NERDTreeShowHidden = 1 " 1 to show hidden files by default
autocmd VimEnter * nnoremap <Leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
autocmd VimEnter * nnoremap <Leader>f :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * call s:CheckDirectory()

function s:CheckDirectory()
  if argc() != 0 && argv() == ['.']
    bd
    NERDTree
  endif
endfunction
