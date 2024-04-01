local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup{
	ensure_installed = "all", -- ensure that only maintained parsers are used
	ignore_install = { "" }, -- list of parsers to ignore
	highlight = {
		enable = true, -- enable the plugin
		disable = { "" }, -- disable for specific languages
		additional_vim_regex_highlighting = false -- also enable vim's regex-based highlighting
	},
	indent = {
		enable = true, -- enable treesitters indentation
		disable = { "" } -- disable for specific languages
	},
    rainbow = {
        enable = true,
        disable = { "" },
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
  },
  autotag = {
      enable = true -- enables autotag
  }
}
