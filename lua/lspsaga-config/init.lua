local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.init_lsp_saga({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- code action title icon
	code_action_icon = " ",
	max_preview_lines = 10,
	finder_action_keys = {
		-- open = "o",
		open = "<CR>",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
	code_action_keys = { quit = "q", exec = "<CR>" },
	border_style = "single",
	server_filetype_map = {},
})
