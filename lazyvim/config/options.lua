vim.opt.cursorline = true
vim.opt.relativenumber = false
vim.opt.statuscolumn = "%s%=%3l | "

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function(event)
    local buftype = vim.bo[event.buf].buftype
    local filetype = vim.bo[event.buf].filetype
    vim.opt_local.cursorline = buftype ~= "" or filetype == "snacks_picker_list"
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    for _, group in ipairs({
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SnacksDashboardNormal",
      "StatusLine",
      "StatusLineNC",
    }) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
    vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "Visual" })
  end,
})

for _, group in ipairs({
  "Normal",
  "NormalNC",
  "NormalFloat",
  "SnacksDashboardNormal",
  "StatusLine",
  "StatusLineNC",
}) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end
vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "Visual" })

local dashboard_laststatus
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_dashboard",
  callback = function()
    if dashboard_laststatus == nil then
      dashboard_laststatus = vim.g.lualine_laststatus or vim.o.laststatus
    end
    vim.opt.laststatus = 0
    vim.opt_local.statusline = ""
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    if vim.bo.filetype == "snacks_dashboard" then
      vim.opt.laststatus = 0
      vim.opt_local.statusline = ""
      for _, group in ipairs({
        "StatusLine",
        "StatusLineNC",
        "lualine_a_normal",
        "lualine_b_normal",
        "lualine_c_normal",
        "lualine_x_normal",
        "lualine_y_normal",
        "lualine_z_normal",
      }) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
      end
    end
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
