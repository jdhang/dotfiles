" ale
if filereadable(".eslintrc")
  let g:ale_linters = { 'javascript': [ 'eslint' ] }
endif

if filereadable(".eslintrc.yml")
  let g:ale_linters = { 'javascript': [ 'eslint' ] }
endif

if filereadable(".eslintrc.json")
  let g:ale_linters = { 'javascript': [ 'eslint' ] }
endif

let g:ale_set_quickfix = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
