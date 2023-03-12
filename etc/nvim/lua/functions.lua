require('util')

local execute = vim.api.nvim_command

function setup_markdown()
  execute(':setlocal textwidth=80')
  execute(':setlocal colorcolumn=81')
  execute(':setlocal spell')
  execute(':hi ColorColumn ctermbg=grey guibg=grey')
end

function strip(str)
  return str:gsub('\n', ''):gsub(' +$', ''):gsub('^ +', '')
end

-- toggle completion stuff
vim.g.cmp_toggle_flag = false -- initialize
local normal_buftype = function()
  return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
end

function toggle_completion()
  local ok, cmp = pcall(require, 'cmp')
  if ok then
    local next_cmp_toggle_flag = not vim.g.cmp_toggle_flag
    if next_cmp_toggle_flag then
      print('completion on')
    else
      print('completion off')
    end
    cmp.setup({
      enabled = function()
        vim.g.cmp_toggle_flag = next_cmp_toggle_flag
        if next_cmp_toggle_flag then
          return normal_buftype
        else
          return next_cmp_toggle_flag
        end
      end,
    })
  else
    print('completion not available')
  end
end
