vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.statuscolumn = "%s%l  "
vim.opt.signcolumn = "yes"
vim.opt.title = true
vim.opt.titlestring = "%t - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - nvim"
vim.opt.termguicolors = true
vim.opt.undofile = true

local gs = require("gitsigns")
local fzf = require("fzf-lua")
local blink = require("blink.cmp")
local conform = require("conform")
local neckpain = require("no-neck-pain")
local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

gs.setup({})

blink.setup({
	keymap = { preset = "enter" },
})

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		zig = { "zigfmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		toml = { "taplo" },
		bash = { "shfmt" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

toggleterm.setup()

local term = Terminal:new({
	direction = "float",
	hidden = true,
	close_on_exit = false,
})
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
local claude = Terminal:new({
	cmd = "claude --continue 2>/dev/null || claude",
	direction = "float",
	hidden = true,
	close_on_exit = false,
})

neckpain.setup({
	autocmds = {
		enableOnVimEnter = true,
	},
})

vim.cmd.colorscheme("catppuccin-nvim")

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

vim.lsp.config("nixd", {
	cmd = { "nixd" },
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

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		if vim.fn.isdirectory(data.file) == 1 then
			vim.cmd.bwipeout(data.buf)
			fzf.files({ cwd = data.file })
		elseif data.file == "" then
			fzf.files()
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "nix", "zig", "json", "jsonc", "toml", "yaml", "markdown", "bash" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files cwd=~/Repos<cr>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>t", function()
	term:toggle()
end)
vim.keymap.set("n", "<leader>g", function()
	lazygit:toggle()
end)
vim.keymap.set("n", "<leader>c", function()
	claude:toggle()
end)

vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
vim.keymap.set("n", "<leader>hR", gs.reset_buffer)
vim.keymap.set("n", "<leader>hi", gs.preview_hunk_inline)
