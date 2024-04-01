require('conform').setup({
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true
	},
	formatters_by_ft = {
		lua = { 'sylua' },
		c = { 'clang-format' },
		javascript = { { 'prettierd', 'prettier' } }
	}
})

require('conform').formatters.c = {
	prepend_args = { '-style', '{ Language: \'C\', ColumnLimit: \'120\' }' }
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
