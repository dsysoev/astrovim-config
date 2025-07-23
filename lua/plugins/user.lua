-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"


local adapter = {
  adapter = "ollama",
  model = "qwen2.5-coder",
}

---@type LazySpec
return {
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },
  {
    'adelarsq/image_preview.nvim',
    event = 'VeryLazy',
    config = function()
        require("image_preview").setup()
    end
  },
  {
    "rafamadriz/friendly-snippets"
  },
  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "neovim"
      vim.g.slime_cell_delimiter = "# %%"
      vim.g.slime_bracketed_pastes = 1
      vim.g.slime_python_ipython = 1
      vim.api.nvim_set_keymap('n', '<leader>mf', "<Plug>SlimeSendCell", { noremap = true, silent = true });
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "stevearc/dressing.nvim", opts = {} },
    },
    opts = {
      strategies = {
        chat = adapter,
        inline = adapter,
        agent = adapter,
      },
      opts = {
        log_level = "DEBUG",
      },
    },
  },
}
