local o = vim.opt

o.hidden = true
o.wrap = false
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.mouse = 'a'
o.showcmd = true
o.cmdheight = 2
o.splitbelow = true
o.splitright = true
o.updatetime = 300
o.shortmess:append 'c'
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.conceallevel = 0
o.hlsearch = true
o.pumheight = 10
o.path = vim.o.path .. '**'
o.completeopt = { 'menuone', 'noselect' }
o.wildmenu = true
o.list = true
o.undofile = true
o.termguicolors = true
o.timeoutlen = 500
o.listchars:append({ tab = '⇥ ', trail = '·' })

-- cursor
o.cursorline = true
o.scrolloff = 8
o.sidescrolloff = 9

-- tabs and indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smarttab = true
o.smartindent = true
o.smartcase = true
o.autoindent = true

-- line numbers
o.number = true
o.relativenumber = true

-- tabline
o.showtabline = 2
