local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--map('n', 'Q', ':wqa<CR>', opts)
--map('n', 's', ':w<CR>', opts)
--map('n', 'S', ':wa<CR>', opts)

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
map('n', '<ESC>', ':nohlsearch<CR>', opts)

-- diagnostics
map('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', { desc = 'Go to previous [D]iagnostics message.' })
map('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', { desc = 'Go to next [D]iagnostics message.' })
map('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic [E]rror message.' })
map('n', '<leader>q', ':lua vim.diagnostic.setloclist()<CR>', { desc = 'Open disagnostic [Q]' })

------------------------------------------------------------------------
-- Plugins --
------------------------------------------------------------------------

-- fterm
map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

--  tagbar
map('n', '<F8>', ':TagbarToggle<CR>', opts)

-- telescope
map('n', '<Leader>sf', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map('n', '<Leader>sg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map('n', '<Leader>sb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
map('n', '<Leader>sh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
map('n', '<Leader>sr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
map('n', '<Leader>sd', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
map('n', '<Leader>si', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
map('n', '<Leader>sw', "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
map('n', '<Leader>s.', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
map('n', '<Leader>sn', "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath 'config' })<CR>", opts)
vim.keymap.set('n', '<Leader>sk', function() require('telescope.builtin').keymaps() end) -- should redo the whole file in this way
map('n',
    '<C-_>',
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown{ windblend = 10, previewer = false })<CR>",
    opts)

-- lazygit
map('n', '<Leader>lg', "<cmd>LazyGit<CR>", opts)

-- DAP

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

-- DAP UI
vim.keymap.set('n', '<leader>du', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>dU', function() require('dapui').close() end)

-----------------------------------
-- plugin files with local keybinds
-- autopairs.lua
-- cmp.lua
-- gitsigns.lua
