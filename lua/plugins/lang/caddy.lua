return {
  -- Плагин для подсветки синтаксиса Caddyfile
  {
    "isobit/vim-caddyfile",
    ft = "caddyfile",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "Caddyfile", "caddy.conf" },
        command = "setfiletype caddyfile",
      })
    end,
  },

  -- Интеграция с LSP (если доступен сервер)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = { -- Для работы с JSON-конфигами Caddy
          settings = {
            json = {
              schemas = {
                {
                  description = "Caddy JSON Schema",
                  fileMatch = { "caddy.json" },
                  url = "https://raw.githubusercontent.com/caddyserver/caddy/v2/schemas/http.json",
                },
              },
            },
          },
        },
      },
    },
  },

  -- Дополнительная настройка Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "dockerfile",
        "json", -- Для работы с JSON-конфигами Caddy
        "yaml", -- Для смежных конфигураций
      },
    },
  },
}
