local ibl_ok, ibl = pcall(require, 'ibl')

if not ibl_ok then
  print('indent-blankline not installed!')
  return
end

ibl.setup {
  indent = {
    highlight = { 'VertSplit' },
    char = '│',
  }
}
