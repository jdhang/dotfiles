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

