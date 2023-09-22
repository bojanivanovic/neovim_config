local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

map('n', 'Q', ':wqa<CR>', opts)
map('n', 's', ':w<CR>', opts)
map('n', 'S', ':wa<CR>', opts)

-- switch between windows
-- map('n', '<C-h>', '<C-w>h', opts)
-- map('n', '<C-j>', '<C-w>j', opts)
-- map('n', '<C-k>', '<C-w>k', opts)
-- map('n', '<C-l>', '<C-w>l', opts)

-- buffers
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<C-x>', ':bdelete<CR>', opts)

-- don't deselect on indent
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- open file in default application
map('n', '<Leader>x', ':!xdg-open %<CR><CR>', opts)

-- edit file under cursor (creates new file if missing)
map('', 'gf', ':tabedit <cfile><CR>', opts)

-- resize splits
map('n', '<C-Left>', ':vertical resize -5<CR>', opts)
map('n', '<C-Right>', ':vertical resize +5<CR>', opts)
map('n', '<C-Down>', ':resize +5<CR>', opts)
map('n', '<C-Up>', ':resize -5<CR>', opts)

-- move lines
map('n', '<A-j>', ':m +1<CR>==', opts)
map('n', '<A-k>', ':m -2<CR>==', opts)
map('v', '<A-j>', ":m '>+1<CR>==", opts)
map('v', '<A-k>', ":m '<-2<CR>==", opts)
map('x', '<A-j>', ":m '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- don't put overwritten text into the register
map('v', 'p', '"_dP', opts)

-- misc
map('n', '<Leader>h', ':nohlsearch<CR>', opts)

------------------------------------------------------------------------
-- Plugins --
------------------------------------------------------------------------

-- fterm
map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

--  tagbar
map('n', '<F8>', ':TagbarToggle<CR>', opts)

-- telescope
map('n', '<Leader>s', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map('n', '<Leader>tg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map('n', '<Leader>b', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
map('n', '<Leader>th', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
map('n', '<Leader>tr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
map('n', '<Leader>td', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
map('n', '<Leader>ti', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
map('n',
    '<C-/>',
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ sorting_strategy=ascending })<CR>",
    opts)

-- lazygit
map('n', '<Leader>gg', "<cmd>LazyGit<CR>", opts)

-----------------------------------
-- plugin files with local keybinds
-- autopairs.lua
-- cmp.lua
-- gitsigns.lua
