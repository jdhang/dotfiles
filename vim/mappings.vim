let mapleader=','

set pastetoggle=<F2>

" more robust exiting commands
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qall qall

" save using ctrl-s
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" quicker splitting
map <Leader>sp :split<cr>
map <Leader>vp :vsplit<cr>

" quicker window movements
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" create and open new file
map <Leader>e :e <C-R>=escape(expand("%p:h"), ' ') . '/'<CR>
