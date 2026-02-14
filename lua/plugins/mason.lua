if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        -- "lua_ls",
        "basedpyright",
        "ruff",
        -- add more arguments for adding more language servers
      },
      automatic_installation = {
        exclude = { "pylsp", "pyright", "jedi_language_server" },
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      methods = {
        diagnostics = false, -- Отключаем диагностику через null-ls для скорости
        formatting = false,   -- Отключаем форматирование через null-ls
      },
      automatic_installation = {
        exclude = { "ruff", "black", "isort", "flake8", "pylint" },
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
