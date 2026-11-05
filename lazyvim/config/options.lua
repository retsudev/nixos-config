-- Disable Trouble's current document-symbol breadcrumb in Lualine.
vim.g.trouble_lualine = false

vim.opt.cursorline = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"
vim.opt.statuscolumn = "%=%2l "

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = function(event)
		local buftype = vim.bo[event.buf].buftype
		local filetype = vim.bo[event.buf].filetype
		vim.opt_local.cursorline = buftype ~= "" or filetype == "snacks_picker_list"
	end,
})

vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "Visual" })

local function set_picker_transparency()
	for _, group in ipairs({
		"SnacksPicker",
		"SnacksPickerInput",
		"SnacksPickerList",
		"SnacksPickerPreview",
		"SnacksPickerBorder",
		"SnacksPickerBox",
		"SnacksPickerTitle",
		"SnacksPickerFooter",
	}) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE", nocombine = true })
	end
end
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_picker_transparency })
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = set_picker_transparency,
})
set_picker_transparency()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
	end,
})
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })

local dashboard_laststatus
local function hide_dashboard_statusline()
	if vim.bo.filetype ~= "snacks_dashboard" then
		return
	end
	if dashboard_laststatus == nil then
		dashboard_laststatus = vim.g.lualine_laststatus or vim.o.laststatus
	end
	vim.opt.laststatus = 0
	vim.opt_local.statusline = ""
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "WinEnter" }, {
	callback = hide_dashboard_statusline,
})
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		vim.schedule(hide_dashboard_statusline)
	end,
})

vim.api.nvim_create_autocmd("BufLeave", {
	callback = function(event)
		if vim.bo[event.buf].filetype == "snacks_dashboard" and dashboard_laststatus ~= nil then
			vim.opt.laststatus = dashboard_laststatus
			dashboard_laststatus = nil
		end
	end,
})
