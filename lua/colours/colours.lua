vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]

vim.o.syntax = 'enable'
vim.o.background = 'dark'
vim.o.colorcolumn = '121'
vim.cmd('highlight ColorColumn ctermbg=235 guibg=grey15')
