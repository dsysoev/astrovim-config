-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"


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
    "mrsobakin/multilayout.nvim",
    opts = {
      layouts = {
        ru = "ru",
      },
      use_libukb = false,
    }
  },
  {
    "NotAShelf/direnv.nvim",
    event = "VeryLazy",
    config = function()
      require("direnv").setup({
        -- Optional: Automatically allow new .envrc files when prompted
        autoload_direnv = true,
        -- Optional: Add a statusline indicator
        statusline = {
          enabled = true,
        },
      })
    end,
  },
  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "neovim"
      vim.g.slime_cell_delimiter = "# %%"
      vim.g.slime_bracketed_pastes = 1
      vim.g.slime_python_ipython = 1
      vim.api.nvim_set_keymap('n', '<leader>mm', "<Plug>SlimeSendCell", { noremap = true, silent = true });
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "ollama",
          },
          inline = {
            adapter = "ollama",
          },
        agent = {
            adapter = "ollama",
          },
        },
        adapters = {
          http = {
            ollama = function()
              return require("codecompanion.adapters").extend("ollama", {
                name = "qwen2.5-coder",
                opts = {
                  vision = false,
                  stream = true,
                },
                schema = {
                  model = {
                    default = "qwen2.5-coder:1.5b-base-q8_0",
                  },
                  num_ctx = {
                    default = 16384,
                  },
                },
              })
            end,
          },
        },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        -- Настройка отображения (иконки)
        formatting = {
          format = function(entry, vim_item)
            local icons = {
              minuet = "   ",
              nvim_lsp = " ",
              buffer = " ",
              path = " ",
            }
            vim_item.kind = string.format("%s %s", icons[entry.source.name] or "", vim_item.kind)
            return vim_item
          end,
        },

        -- Горячие клавиши для меню
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Вызвать меню вручную
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter подтверждает выбор
        }),

        -- Источники данных (Порядок важен!)
        sources = cmp.config.sources({
          -- { name = "minuet" },   -- ИИ на первом месте
          { name = "path" },     -- Пути к файлам
          { name = "nvim_lsp" }, -- Подсказки сервера (типы, методы)
        }, {
          { name = "buffer" },   -- Текст из текущего файла
        }),

        -- performance = {
        --   -- Даем ИИ 2 секунды на ответ, чтобы не блокировать интерфейс
        --   fetching_timeout = 1000,
        --   async_budget = 5,
        -- },
      })
    end,
  },
}
