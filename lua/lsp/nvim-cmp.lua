-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,longest,preview"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item(), -- previous suggestion
		["<C-k>"] = cmp.mapping.select_prev_item(), -- next suggestion
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping(function(fallback)
			if not cmp.confirm(option) then
				fallback()
			end
			-- .confirm {
			-- behavior = cmp.ConfirmBehavior.Replace,
			-- select = false,
		end, { "i", "s" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			elseif cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end

			-- if cmp.visible() then
			--   cmp.select_next_item()
			-- elseif luasnip.expand_or_jumpable() then
			--   luasnip.expand_or_jump()
			-- elseif has_words_before() then
			--   cmp.complete()
			-- else
			--   fallback()
			-- end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			elseif cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end

			-- if cmp.visible() then
			--   cmp.select_prev_item()
			-- elseif luasnip.jumpable(-1) then
			--   luasnip.jump(-1)
			-- else
			--   fallback()
			-- end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	},
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
