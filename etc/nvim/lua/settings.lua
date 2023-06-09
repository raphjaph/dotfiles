require('plugins')
require('util')

-- ==============================================================================
-- Telescope
-- ==============================================================================

local telescope = require('telescope')

local extensions = { 'file_browser', 'fzf', 'harpoon'}

for _, extension in ipairs(extensions) do
  telescope.load_extension(extension)
end

local dropdown = {
  theme = 'dropdown',
  previewer = false,
  layout_config = { height = 0.5, width = 0.8 },
}

local ivy = {
  theme = 'ivy',
  previewer = false,
  border = false,
  layout_config = { height = 10 },
}

telescope.setup({
  defaults = {
    prompt_prefix = '> ',
  },
  pickers = {
    buffers = dropdown,
    file_browser = ivy,
    find_files = dropdown,
    git_files = dropdown,
    -- lsp_references = ivy,
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

-- ==============================================================================
-- Treesitter
-- ==============================================================================

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    -- 'bash',
    -- 'c',
    -- 'css',
    -- 'go',
    -- 'html',
    -- 'java',
    -- 'javascript',
    -- 'lua',
    -- 'nix',
    -- 'python',
    -- 'rust',
    -- 'toml',
    -- 'typescript',
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<cr>',
      node_incremental = '<cr>',
      scope_incremental = '<tab>',
      node_decremental = '<bs>',
    },
  },

  additional_vim_regex_highlighting = false,
})

-- Setup  treesitter for just
require('tree-sitter-just').setup({})

-- ==============================================================================
-- Harpoon 
-- ==============================================================================
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<LEADER>a", mark.add_file)
vim.keymap.set("n", "<LEADER>mm", "<CMD>Telescope harpoon marks<CR>")
vim.keymap.set("n", "<C-w>", function() ui.nav_prev() end)
vim.keymap.set("n", "<C-e>", function() ui.nav_next() end)

-- vim.keymap.set("n", "<LEADER>1", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<LEADER>2", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<LEADER>3", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<LEADER>4", function() ui.nav_file(4) end)


-- ==============================================================================
-- LSP
-- ==============================================================================

local lsp = require('lspconfig')

local on_attach = function(client)
  map('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
  map('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
  map('n', 'gr', '<CMD>Telescope lsp_references<cr>')
  map('n', 'gy', '<CMD>lua vim.lsp.buf.type_definition()<CR>')
  map('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')
  map('n', '<C-k>', '<CMD> lua vim.lsp.buf.signature_help()<CR>')
  map('n', '<LEADER>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<SPACE>aa', '<CMD>lua vim.lsp.buf.code_action()<CR>')
  map('n', '<LEADER>=', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
  map('n', '<SPACE>tt', '<CMD>lua toggle_completion()<CR>')
end

local servers = {
  'gopls',
  'pyright',
  'rust_analyzer',
  'lua_ls',
}

for _, server in ipairs(servers) do
  lsp[server].setup({
    on_attach = on_attach,
    settings = {
      [server] = {
        diagnostics = { disabled = { 'inactive-code' } },
      },
    },
  })
end

-- ==============================================================================
-- LSP Autocomplete (nvim-cmp)
-- ==============================================================================
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-k>'] = cmp.mapping({
      i = function()
        if cmp.visible() then
          cmp.abort()
          toggle_completion()
        else
          cmp.complete()
          toggle_completion()
        end
      end,
    }),
    ['<CR>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          toggle_completion()
        else
          fallback()
        end
      end,
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- ==============================================================================
-- Bufferline & Lualina
-- ==============================================================================

require('bufferline').setup({
  animation = false,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  hide = { extensions = false, inactive = false },
  highlight_alternate = false,
  highlight_visible = false,
  icons = {
    buffer_index = true,
    filetype = { enabled = false },
    buttons = 'x',
    diagnostics = {{ enabled = true },},
  },
  insert_at_end = true,
})

require('lualine').setup({
  options = {
    icons_enabled = true,
    lower = true,
    -- theme = 'base16',
    theme = 'gruvbox-material',
  },
  statusline = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', { 'filename', file_status = true, path = 1 }, 'diff' },
    lualine_c = { 'lsp_progress' },
  },
})

-- =============================================================================
-- Miscellaneous
-- =============================================================================

vim.g.markdown_composer_autostart = 0
vim.g.markdown_composer_syntax_theme = 'dark'
vim.g.markdown_folding = 0
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_new_list_item_indent = 0

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
map('n', '<F3>', '<CMD>Lexplore<CR>')

require('nvim_comment').setup()
vim.keymap.set('n', '<C-c>', '<CMD>CommentToggle<CR>', opts)

vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-z>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-b>'

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})
