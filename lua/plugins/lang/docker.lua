return {
  -- Настройка LSP через nvim-lspconfig для Docker
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- LSP для Dockerfile
        dockerls = {
          settings = {
            docker = {
              podman = true, -- Поддержка Podman
            },
          },
          filetypes = { "dockerfile", "Dockerfile", "Containerfile" },
        },

        docker_compose_language_service = {
          filetypes = { "yaml", "yml" },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "hadolint", -- Линтинг Dockerfile
        "dockerfile-language-server", -- LSP сервер для Dockerfile
        "docker-compose-language-service", -- LSP сервер для Docker Compose
      },
    },
  },

  -- Плагин Treesitter для поддержки синтаксиса Dockerfile
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "dockerfile", -- Синтаксис Dockerfile
      },
    },
  },
}
