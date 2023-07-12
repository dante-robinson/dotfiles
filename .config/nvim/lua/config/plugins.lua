local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    -- Package Manager
    use "wbthomason/packer.nvim"
    -- Useful lua functions used by other plugins
    use "nvim-lua/plenary.nvim"
    -- Icons
    use "kyazdani42/nvim-web-devicons"
    -- Theme
    use "folke/tokyonight.nvim"
    -- Extra Syntax Highlighting
    use "sheerun/vim-polyglot"
    -- Fuzzy Finder
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = "nvim-lua/plenary.nvim" }
    -- File Finder
    use { 'ms-jpq/chadtree', branch = 'chad', run = "python3 -m chadtree deps"}
    -- Tabs
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
    -- Status Bar
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    -- Indentation Guides
    use "lukas-reineke/indent-blankline.nvim"
    -- Caches lua to loader faster
    use 'lewis6991/impatient.nvim'
    -- Start Menu
    use 'mhinz/vim-startify'
    -- Completions
    use "hrsh7th/nvim-cmp"
    -- Buffer Completions
    use "hrsh7th/cmp-buffer"
    -- Path Completions
    use "hrsh7th/cmp-path"
    -- Snippet Completions
    use "saadparwaiz1/cmp_luasnip"
    -- Connect cmp to lsp 
    use "hrsh7th/cmp-nvim-lsp"
    -- Extra Lua Completions
    use "hrsh7th/cmp-nvim-lua"
    -- Snippets
    use "L3MON4D3/LuaSnip"
    -- Extra Snippets
    use "rafamadriz/friendly-snippets"
    -- Highlighting words under cursor
    use "RRethy/vim-illuminate"
    -- Autoclose
    use "windwp/nvim-autopairs"
    -- Comments Keybinds
    use "numToStr/Comment.nvim"
    -- Linter
    use 'mfussenegger/nvim-lint'
    -- LSP
    use {
  	  'VonHeikemen/lsp-zero.nvim',
  	  branch = 'v2.x',
  	  requires = {
            -- LSP Support
    	    {'neovim/nvim-lspconfig'},
    	  },
    }
    -- Formatter
    require('packer').use { 'mhartington/formatter.nvim' }

    if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
