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
  model = "yi-coder:1.5b",
  -- model = "yi-coder",
  -- model = "deepseek-coder-v2",
}

---@type LazySpec
return {
  -- {
  --      "benlubas/molten-nvim",
  --      dependencies = { "3rd/image.nvim" },
  --      version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --      build = ":UpdateRemotePlugins",
  --      init = function()
  --          -- this is an example, not a default. Please see the readme for more configuration options
  --          vim.g.molten_output_win_max_height = 12
  --          vim.g.molten_image_provider = "image.nvim"
  --          vim.g.molten_use_border_highlights = true
  --          -- add a few new things
  --          vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
  --          vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>")
  --          -- vim.keymap.set("n", "<leader>mrr", ":MoltenReevaluateCell<CR>")
  --          vim.keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv")
  --          vim.keymap.set("n", "<leader>ms", ":noautocmd MoltenEnterOutput<CR>")
  --          vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>")
  --          vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>")
  --      end,
  --  },
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },
  { "RutaTang/quicknote.nvim",
    config = function()
      -- you must call setup to let quicknote.nvim works correctly
      require("quicknote").setup({
          mode = "portable", -- "portable" | "resident", default to "portable"
          sign = "Y", -- This is used for the signs on the left side (refer to ShowNoteSigns() api).
                      -- You can change it to whatever you want (eg. some nerd fonts icon), 'N' is default
          filetype = "md",
          git_branch_recognizable = true, -- If true, quicknote will separate notes by git branch 
                                          -- But it should only be used with resident mode,  it has not effect used with portable mode
      })
      vim.api.nvim_set_keymap("n", "<leader>Nn", "<cmd>:lua require('quicknote').NewNoteAtCurrentLine()<cr>",{})
      vim.api.nvim_set_keymap("n", "<leader>Ne", "<cmd>:lua require('quicknote').ExportNotesForCurrentBuffer()<cr>",{})
    end,
    dependencies = { "nvim-lua/plenary.nvim"}
  },
  -- {
  --      "vhyrro/luarocks.nvim",
  --      priority = 1001, -- this plugin needs to run before anything else
  --      -- config = true,
  --      -- opts = {
  --        -- rocks = { "magick" },
  --        -- luarocks_build_args = {
  --           -- "--with-lua-include=/usr/include/",
  --        -- },
  --      -- },
  --     -- dependencies = {
  --     --   "MunifTanjim/nui.nvim",
  --     --   "nvim-neotest/nvim-nio",
  --     --   "nvim-neorg/lua-utils.nvim",
  --     --   "nvim-lua/plenary.nvim",
  --     --   "pysan3/pathlib.nvim",
  --     -- },
  --  },
  -- {
  --      "3rd/image.nvim",
  --      priority = 1001,
  --      dependencies = { "luarocks.nvim", "nvim-treesitter/nvim-treesitter", "leafo/magick" },
  --      config = function()
  --         -- default config
  --         require("image").setup({
  --           backend = "kitty",
  --           -- processor = "magick_rock", -- or "magick_cli"
  --           processor = "magick_cli", -- or "magick_cli"
  --           integrations = {
  --             markdown = {
  --               enabled = true,
  --               clear_in_insert_mode = false,
  --               download_remote_images = false,
  --               only_render_image_at_cursor = false,
  --               filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
  --             },
  --             neorg = {
  --               enabled = true,
  --               clear_in_insert_mode = false,
  --               download_remote_images = false,
  --               only_render_image_at_cursor = false,
  --               filetypes = { "norg" },
  --             },
  --             html = {
  --               enabled = false,
  --             },
  --             css = {
  --               enabled = false,
  --             },
  --           },
  --           max_width = nil,
  --           max_height = nil,
  --           max_width_window_percentage = nil,
  --           max_height_window_percentage = 50,
  --           window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  --           window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --           editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  --           tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  --           hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  --         })
  --      end,
  --  },
   -- {
   --     "3rd/image.nvim",
   --     -- priority = 1002,
   --     dependencies = { "luarocks.nvim", "nvim-treesitter/nvim-treesitter" },
   --     opts = {
   --      backend = "kitty",
   --      -- processor = "magick_rock", -- or "magick_cli"
   --      processor = "magick_cli", -- or "magick_cli"
   --      integrations = {
   --        markdown = {
   --          enabled = true,
   --          clear_in_insert_mode = false,
   --          download_remote_images = true,
   --          only_render_image_at_cursor = false,
   --          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
   --        },
   --        neorg = {
   --          enabled = true,
   --          clear_in_insert_mode = false,
   --          download_remote_images = true,
   --          only_render_image_at_cursor = false,
   --          filetypes = { "norg" },
   --        },
   --        html = {
   --          enabled = false,
   --        },
   --        css = {
   --          enabled = false,
   --        },
   --      },
   --      max_width = nil,
   --      max_height = nil,
   --      max_width_window_percentage = nil,
   --      max_height_window_percentage = 50,
   --      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
   --      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
   --      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
   --      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
   --       -- backend = "kitty",
   --     --   backend = "kitty",
   --     --   markdown = {
   --     --       enable = true,
   --     --   },
   --     --   css = {
   --     --       enable = true,
   --     --   },
   --     --   html = {
   --     --       enable = true,
   --     --   },
   --     --   hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
   --     },
   -- },
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
