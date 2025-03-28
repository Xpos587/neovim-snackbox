return {
  -- Плагин Mason для управления инструментами для Markdown
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- Форматтер для Markdown
        "markdownlint", -- Линтер для Markdown
      },
    },
  },

  -- Плагин Treesitter для поддержки синтаксиса Markdown
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
      },
    },
  },

  -- Плагин для улучшенной работы с Markdown
  {
    "tadmccorkle/markdown.nvim",
    ft = { "markdown" },
    opts = {}, -- Здесь можно добавить дополнительные настройки, если нужно
  },

  -- Плагин для рендеринга Markdown (опционально)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      checkbox = {
        enabled = true,
        position = "inline",
      },
    },
  },

  -- Установка wrap-опций только для файлов Markdown
  {
    "nvim-lua/plenary.nvim", -- Зависимость для создания автокоманд
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function()
          vim.opt_local.wrap = true
        end,
      })
    end,
  },
}
