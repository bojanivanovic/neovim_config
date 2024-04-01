local o = vim.opt

o.hidden = true
o.wrap = false
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.mouse = 'a'
o.showcmd = true
o.showmode = false
o.breakindent = true
o.cmdheight = 2
o.splitbelow = true
o.splitright = true
o.updatetime = 300
o.timeoutlen = 500
o.shortmess:append 'c'
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'
o.conceallevel = 0
o.hlsearch = true
o.pumheight = 10
o.path = vim.o.path .. '**'
o.completeopt = { 'menuone', 'noselect' }
o.wildmenu = true
o.list = true
o.listchars:append({ tab = '⇥ ', trail = '·', nbsp = '␣' })
o.undofile = true
o.termguicolors = true
o.inccommand = 'split'

-- cursor
o.cursorline = true
o.scrolloff = 10
o.sidescrolloff = 10

-- tabs and indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smarttab = true
o.smartindent = true
o.autoindent = true

-- line numbers
o.number = true
o.relativenumber = true

-- tabline
o.showtabline = 2

-- nerdfont
vim.g.have_nerd_font = true

-- highlight yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlights when yanking text.',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
