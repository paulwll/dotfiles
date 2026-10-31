-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- keep plugin windows transparent
local transparent_groups = {
  -- snacks
  "snacksnormal",
  "snacksnormalnc",
  "snackswinbar",
  "snackswinbarnc",

  -- snacks picker / explorer
  "snackspicker",
  "snackspickerlist",
  "snackspickerinput",
  "snackspickerpreview",

  -- borders
  "SnacksPickerBorder",
  "SnacksPickerListBorder",
  "SnacksPickerInputBorder",
  "SnacksPickerPreviewBorder",
  "SnacksPickerTitle",
  "FloatTitle",

  -- dap ui
  "dapuinormal",
  "dapuinormalnc",
  "dapuifloatnormal",
}

local function make_transparent()
  for _, group in ipairs(transparent_groups) do
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
      name = group,
      link = false,
    })

    if ok then
      hl.bg = nil
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end

-- apply after the colorscheme
vim.api.nvim_create_autocmd("colorscheme", {
  callback = function()
    vim.schedule(make_transparent)
  end,
})

-- apply again whenever plugin windows appear
vim.api.nvim_create_autocmd("bufwinenter", {
  callback = function()
    vim.schedule(make_transparent)
  end,
})

make_transparent()

-- 42 indentation rules for C files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})
