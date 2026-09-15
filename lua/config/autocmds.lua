-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    vim.fn.system("wezterm set-user-var IS_NVIM true")
    local cwd = vim.fn.getcwd()
    vim.fn.chansend(vim.v.stderr, string.format("\027]7;file://%s%s\027\\", vim.uv.os_gethostname(), cwd))
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.system("wezterm set-user-var IS_NVIM false")
  end,
})

-- Set `textwidth` from the project prettier config, so that `gw`/`gq` reflow
-- comments to the same column that prettier uses for code.
-- NovadeLiteBackend uses 140, NovadeLiteBackendServices uses 120.
local print_width_cache = {}

local function prettier_print_width(dir)
  if print_width_cache[dir] ~= nil then
    return print_width_cache[dir] or nil
  end
  local configs = vim.fs.find({
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.json5",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.js",
    "prettier.config.js",
    "prettier.config.mjs",
    "package.json",
  }, { path = dir, upward = true, limit = math.huge })

  local width = false
  for _, file in ipairs(configs) do
    local ok, lines = pcall(vim.fn.readfile, file)
    local found = ok and table.concat(lines, "\n"):match("['\"]?printWidth['\"]?%s*[:=]%s*(%d+)")
    if found then
      width = tonumber(found)
      break
    end
  end

  print_width_cache[dir] = width
  return width or nil
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("prettier_textwidth", { clear = true }),
  callback = function(ev)
    local name = vim.api.nvim_buf_get_name(ev.buf)
    if name == "" or vim.bo[ev.buf].buftype ~= "" then
      return
    end
    local width = prettier_print_width(vim.fs.dirname(name))
    if not width then
      return
    end
    vim.bo[ev.buf].textwidth = width
    -- Wrap comments only, never code: drop `t`, keep `c`, `q` and `j`.
    local fo = vim.bo[ev.buf].formatoptions:gsub("t", "")
    for flag in ("cqj"):gmatch(".") do
      if not fo:find(flag, 1, true) then
        fo = fo .. flag
      end
    end
    vim.bo[ev.buf].formatoptions = fo
  end,
})
