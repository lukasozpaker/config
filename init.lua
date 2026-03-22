-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
	{ "akinsho/horizon.nvim", version = "*" },

	{
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      keys = {
        { "<leader>o", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
      },
    },

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "horizon" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd.colorscheme('horizon')
-------------------------------
-- END LAZY NVIM AND PLUGINS
-------------------------------

-- basics
vim.opt.number = true
vim.opt.wrap = true
vim.opt.wildmenu = true       -- enhanced command line completion
vim.opt.lazyredraw = true     -- don't redraw screen while executing macros
vim.opt.showmatch = true
vim.opt.scrolloff = 5
vim.opt.mouse = 'a'           -- enable mouse support

-- remaps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- yank to system clipboard (+ register)
vim.keymap.set('v', 'y', '"+y')
vim.keymap.set('n', 'yy', '"+yy')

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- miscellaneous
-- vim.opt.background = 'dark'
vim.opt.termguicolors = true

