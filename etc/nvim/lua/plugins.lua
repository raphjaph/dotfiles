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

  -- Telescope File Browser
  'nvim-telescope/telescope-file-browser.nvim',

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- Native LSP collection of commmon configs
  'neovim/nvim-lspconfig',

  -- LSP autocomplete completion sources
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',

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
  { 'plasticboy/vim-markdown', ft = 'markdown' },

  -- Pretty and lightweight status and tab lines
  -- 'vim-airline/vim-airline',
  -- 'vim-airline/vim-airline-themes',

  -- Git annoations
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',

  -- Statusline & Bufferline
  -- {'nvim-lualine/lualine.nvim', dependencies = 'kyazdani42/nvim-web-devicons'},
  'nvim-lualine/lualine.nvim',
  'arkav/lualine-lsp-progress',
  { 'romgrk/barbar.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

  -- Snippets
  'SirVer/ultisnips',

  -- Harpoon: File jumping
  'ThePrimeagen/harpoon'
})

--  --  Changes Vim working directory to project root
--  use('airblade/vim-rooter')
--
--  -- Support .editorconfig
--  use('editorconfig/editorconfig-vim')
--
--  -- A vim alignment plugin
--  use('junegunn/vim-easy-align')
--
--  -- Cool start screen
--  use('mhinz/vim-startify')
--
--  -- Toml syntax
--  use('cespare/vim-toml')
--
--  -- Distraction free writing
--  use('junegunn/goyo.vim')
--
--  -- GLSL syntax highlighting
--  use('tikhomirov/vim-glsl')
--
--  -- A better latex editing experience
--  use({
--    'lervag/vimtex',
--    ft = 'tex',
--  })
--
--  -- Latex concealer
--  use({
--    'KeitaNakamura/tex-conceal.vim',
--    ft = 'tex',
--  })
--
--  -- Text filtering and alignment
--  use({
--    'godlygeek/tabular',
--    cmd = 'Tabularize',
--  })
--
--  -- Rust support
--  use({
--    'rust-lang/rust.vim',
--    ft = 'rust',
--  })
--
--  -- Query ChatGPT
--  use({
--    'terror/chatgpt.nvim',
--    run = 'pip3 install -r requirements.txt',
--  })
--end)
