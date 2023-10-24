require('plugins')
require('util')

-- ==============================================================================
-- Telescope
-- ==============================================================================

local telescope = require('telescope')

local extensions = { 'file_browser', 'fzf' }

for _, extension in ipairs(extensions) do
  telescope.load_extension(extension)
end

local dropdown = {
  layout_strategy = 'vertical',
  layout_config = {
    height = 0.95,
    width = 0.95,
    preview_height = 0.7,
    prompt_position = 'top',
    mirror = false,
  },
}

local dropdown_no_preview = {
  previewer = false,
  layout_strategy = 'vertical',
  layout_config = {
    height = 0.9,
    width = 0.9,
    prompt_position = 'bottom',
  },
}

telescope.setup({
  defaults = {
    prompt_prefix = '> ',
  },
  pickers = {
    buffers = dropdown,
    file_browser = dropdown,
    find_files = dropdown_no_preview,
    git_files = dropdown,
    live_grep = dropdown,
    lsp_references = dropdown,
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
    'cpp',
    'css',
    'glsl',
    'go',
    'html',
    'java',
    'javascript',
    'latex',
    'lua',
    'nix',
    'python',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'typescript',
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
  client.server_capabilities.semanticTokensProvider = nil -- disable semantic highlighting
end

local servers = {
  -- 'clangd',
  'gopls',
  'lua_ls',
  -- 'lua-language-server',
  'pyright',
  'rust_analyzer',
  'tsserver',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(servers) do
  lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      [server] = {
        diagnostics = { disabled = { 'inactive-code' } },
      },
    },
  })
end

-- ==============================================================================
-- Luasnip
-- ==============================================================================
local luasnip = require('luasnip')

require('luasnip.loaders.from_snipmate').lazy_load()

luasnip.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
})

-- ==============================================================================
-- LSP Autocomplete (nvim-cmp)
-- ==============================================================================
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
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

require('barbar').setup({
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
    diagnostics = { enabled = true },
  },
  insert_at_end = true,
}
)

require('lualine').setup({
  options = {
    icons_enabled = true,
    lower = true,
    -- theme = 'base16',
    theme = 'gruvbox-material',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', { 'filename', file_status = true, path = 1 }, 'diff' },
    lualine_c = {},
  },
})


-- =============================================================================
-- Startify
-- =============================================================================

vim.g.startify_custom_header = {
  '                                                            ',
  '                                                            ',
  '                                                            ',
  '                                        ░░                  ',
  '      ███████   █████   ██████  ██    ██ ██ ██████████      ',
  '     ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██     ',
  '      ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██     ',
  '      ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██     ',
  '      ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██     ',
  '     ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░      ',
  '                                                            ',
  '                                                            ',
}

vim.g.startify_bookmarks = {
  { v = '~/dotfiles/config/nvim/init.lua' },
}

vim.g.startify_commands = {
  { ch = { 'Health Check', ':checkhealth' } },
  { ps = { 'Plugin sync', ':LazySync' } },
  { pu = { 'Update neovim plugins', ':LazyUpdate' } },
  { h = { 'Help', ':help' } },
}




-- =============================================================================
-- Markdown
-- =============================================================================

vim.g.markdown_composer_autostart = 0
vim.g.markdown_composer_syntax_theme = 'dark'
vim.g.markdown_folding = 0
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_new_list_item_indent = 0


-- =============================================================================
-- Miscellaneous
-- =============================================================================

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
