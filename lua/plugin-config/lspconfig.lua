local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- key binds
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts) -- open floating diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- go to next diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- go to previous diagnostic
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts) -- display diagnostic list

local function lsp_keymaps(bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- go to declaration
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- go to definition
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts) -- go to type definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- open hover
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- go to implementation
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) -- signature help
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- refactor rename
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- code actions
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- list references
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- on attach
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- enable completion via <c-x><c-o>
    lsp_keymaps(bufnr) -- load key binds

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
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- server setup
require'lspconfig'.html.setup{ -- html lsp
    on_attach = on_attach,
    capabilities = capabilities
}
require'lspconfig'.sumneko_lua.setup{ -- html lsp
    on_attach = on_attach,
    capabilities = capabilities
}
require'lspconfig'.tsserver.setup{ -- typescript lsp
    on_attach = on_attach,
    capabilities = capabilities,
}
require'lspconfig'.jsonls.setup{ -- json lsp
    on_attach = on_attach,
    capabilities = capabilities
}
