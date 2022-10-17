-- Common Configuration
local M = {}

local function key_maps(bufnr)
	--Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { buffer=bufnr, noremap=true, silent=true }

	local maps = {
		["<leader>l"] = {
			name = "Lsp",
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
			k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
			h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Help" },
			n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
			l = { "<cmd>lua vim.diagnostic.open_float({scope = 'line'})<CR>", "Show Diagnostics" },
		},
		["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostics" },
		["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostics" }
	}

	require("which-key").register(maps, opts);
end

local function documentHighlight(client, bufnr)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		local lsp_document_highlight = vim.api.nvim_create_augroup("config_lsp_document_highlight", {clear = false})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = lsp_document_highlight
		})
		vim.api.nvim_create_autocmd(
			"CursorHold",
			{
				callback = function() vim.lsp.buf.document_highlight() end,
				group = lsp_document_highlight,
				buffer = 0
			}
		)
		vim.api.nvim_create_autocmd(
			"CursorMoved",
			{
				callback = function() vim.lsp.buf.clear_references() end,
				group = lsp_document_highlight,
				buffer = 0
			}
		)
	end
end

function M.common_on_attach(client, bufnr)
	key_maps(bufnr)
	local lsp_hover_augroup = vim.api.nvim_create_augroup("config_lsp_hover", {clear = false})
	vim.api.nvim_clear_autocmds({
		buffer = bufnr,
		group = lsp_hover_augroup
	})
	vim.api.nvim_create_autocmd(
		"CursorHold",
		{
			callback = function()
				for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
					if vim.api.nvim_win_get_config(winid).relative ~= "" then
						return
					end
				end
				vim.diagnostic.open_float()
			end,
			group = lsp_hover_augroup,
			buffer = bufnr
		}
	)
	documentHighlight(client, bufnr)
	--require("nvim-navic").attach(client, bufnr)
end

-- cmp-lsp capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)


return M