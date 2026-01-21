-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Statusline configuration
vim.opt.laststatus = 3 -- Global statusline
vim.opt.showmode = false -- Don't show mode in command line (shown in statusline)

-- Custom statusline with Starship-inspired icons
-- This will be overridden by lualine if installed, but provides a fallback
local function statusline()
  local icons = {
    git_branch = " ",
    folder = " ",
    lock = "󰌾",
    modified = "●",
  }

  local mode_map = {
    n = "N",
    i = "I",
    v = "V",
    V = "V",
    [""] = "V",
    c = "C",
    s = "S",
    S = "S",
    [""] = "S",
    R = "R",
    r = "R",
    ["!"] = "!",
    t = "T",
  }

  local mode = mode_map[vim.fn.mode()] or "?"
  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[No Name]"
  end

  local modified = vim.bo.modified and " " .. icons.modified or ""
  local readonly = vim.bo.readonly and " " .. icons.lock or ""
  local filetype = vim.bo.filetype ~= "" and " " .. vim.bo.filetype or ""
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local total = vim.fn.line("$")

  return string.format(
    " %s  %s%s%s %%=%s  %d:%d  %d/%d ",
    mode,
    filename,
    modified,
    readonly,
    filetype,
    line,
    col,
    line,
    total
  )
end

vim.opt.statusline = "%!v:lua.require'config.options'.statusline()"

-- Export the statusline function
return {
  statusline = statusline,
}
