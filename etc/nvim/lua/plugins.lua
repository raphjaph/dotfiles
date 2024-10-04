require('util')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

opt('g', 'mapleader', ' ')

require('lazy').setup({
  -- Paper Color
  'pappasam/papercolor-theme-slim',

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'neovim/nvim-lspconfig',
  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },

  -- LSP autocomplete completion sources
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
  },
  'nvim-telescope/telescope-file-browser.nvim',

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- Vim Tmux splits
  'christoomey/vim-tmux-navigator',

  -- Indentation
  'tpope/vim-sleuth',

  -- Quick commenting
  'terrortylor/nvim-comment',
  -- 'tpope/vim-commentary',

  -- Pipe errors to nvim and quickfix jumps
  {
    'alopatindev/cargo-limit',
    build = 'cargo install cargo-limit nvim-send',
  },
  'romainl/vim-qf',

  -- Just things
  'NoahTheDuke/vim-just',
  'IndianBoy42/tree-sitter-just',

  -- Markdown rendering and syntax highlighting
  {
    'euclio/vim-markdown-composer',
    cmd = 'ComposerStart',
    ft = 'markdown',
    build = 'cargo build --release --locked',
  },
  { 'plasticboy/vim-markdown',   ft = 'markdown' },

  -- Git annoations
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',

  -- Statusline & Bufferline
  { 'romgrk/barbar.nvim',        dependencies = 'lewis6991/gitsigns.nvim' },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

  -- Snippets source for nvim-cmp
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  -- 'SirVer/ultisnips',

  -- Cool start screen
  'mhinz/vim-startify',

  -- AI
  --{
  --  "yetone/avante.nvim",
  --  event = "VeryLazy",
  --  build = "make",
  --  opts = {
  --    -- add any opts here
  --  },
  --  dependencies = {
  --    "nvim-tree/nvim-web-devicons",
  --    "stevearc/dressing.nvim",
  --    "nvim-lua/plenary.nvim",
  --    "MunifTanjim/nui.nvim",
  --  },
  --},
})
