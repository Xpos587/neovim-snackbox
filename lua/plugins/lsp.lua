return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim", -- Для поддержки TypeScript
    },
    opts = {
      servers = {
        -- Настройка Pyright для Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "strict", -- Строгая проверка типов
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        rust_analyzer = {
          enabled = false, -- Отключаем настройку rust_analyzer здесь
        },
        -- Настройка tsserver для TypeScript
        tsserver = {},
        dockerls = { -- LSP для Dockerfile
          settings = {
            docker = {
              podman = true, -- Поддержка Podman
            },
          },
          filetypes = { "dockerfile", "Dockerfile", "Containerfile" },
        },
        docker_compose_language_service = {
          filetypes = { "yaml", "yml" },
        }, -- LSP для Docker Compose
      },
    },
    setup = {
      -- Настройка TypeScript через typescript.nvim
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },

  -- Подключение null-ls для форматирования и линтинга
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black, -- Форматирование Python
          null_ls.builtins.diagnostics.ruff, -- Линтинг Python через Ruff
          null_ls.builtins.diagnostics.markdownlint, -- Линтинг Markdown
          null_ls.builtins.formatting.rustfmt, -- Форматирование для Rust
          null_ls.builtins.diagnostics.hadolint, -- Линтинг Containerfile
          null_ls.builtins.formatting.prettier.with({ -- Форматирование Prettier
            filetypes = {
              "markdown",
              "yaml",
              "yml",
              "toml",
              "ini",
              "json",
              "jsonc",
              "Dockerfile",
              "Containerfile",
            },
          }),
        },
      })
    end,
  },
}
