vim.g.mapleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.statuscolumn = "%s%l  "
vim.opt.title = true
vim.opt.titlestring = "%t - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - nvim"

vim.cmd.colorscheme("catppuccin-nvim")

vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.config("njxd", {
	ckd = { "nixd" },
	filetypes = { "nix" },
	settings = {
		nixd = {
			formatting = {
				command = { "nixfmt" },
			},
		},
	},
})

vim.lsp.config("zls", {
	cmd = { "zls" },
	filetypes = { "zig" },
	root_markers = { "build.zig" },
})

vim.lsp.enable({ "lua_ls", "nixd", "zls" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})

require("gitsigns").setup()

require("blink.cmp").setup({
	keymap = { preset = "enter" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		zig = { "zigfmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

require("no-neck-pain").setup({
	autocmds = {
		enableOnVimEnter = true,
	},
})
