return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff", -- Линтер для Python
        "black", -- Форматирование Python
        "pyright", -- LSP для Python
        "prettier", -- Форматирование для JSON, YAML, TOML и других
        "markdownlint", -- Линтинг Markdown
        "stylua", -- Форматирование Lua
        "shellcheck", -- Проверка Bash-скриптов
        "shfmt", -- Форматирование Bash-скриптов
        "codelldb", -- Отладчик для Rust
        "rust-analyzer", -- LSP сервер,
        "hadolint", -- Линтер для Dockerfile
        "dockerfile-language-server", -- LSP для Dockerfile
        "docker-compose-language-service", -- LSP для Docker Compose,
      },
    },
  },
}
