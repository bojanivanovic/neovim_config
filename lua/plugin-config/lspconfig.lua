local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- key binds
local mainopts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        map('gd', require('telescope.builtin').lsp_definitions, '[g]o to [d]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[g]o to [r]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[g]o to [I]mplementations')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinitions')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ctions')
        map('K', vim.lsp.buf.hover, 'Hover documentation')
        map('gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')
        -- map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace folder - [a]dd')
        -- map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace folder - [r]emove')
        -- map('<leader>wl', vim.lsp.buf._workspace_folder, '[w]orkspace folder - [r]emove')
        --
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>f', function()
        --   vim.lsp.buf.format { async = true }
        -- end, opts)

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = ev.buf,
                callback = vim.lsp.buf.document_highlight
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = ev.buf,
                callback = vim.lsp.buf.clear_references
            })
        end
    end,
})

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, mainopts)

-- on attach
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- enable completion via <c-x><c-o>
    -- lsp_keymaps(bufnr) -- load key binds

    -- highlighting
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end
end

-- server capabilities
local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
    return
end
