local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Если lazy.nvim ещё не установлен, клонируем его из репозитория
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.notify("Cloning lazy.nvim from " .. repo, vim.log.levels.INFO)
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    repo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...", "ErrorMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Добавляем lazy.nvim в runtime path
vim.opt.rtp:prepend(lazypath)

-- Настраиваем lazy.nvim
require("lazy").setup({
  spec = {
    -- Подключаем LazyVim вместе с его настройками и плагинами
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Импортируем ваши собственные плагины
    { import = "plugins" },
    { import = "plugins.lang" },
  },
  defaults = {
    -- Ваши пользовательские плагины будут загружаться при старте
    lazy = false,
    -- Используем последний коммит вместо версионирования
    version = false,
  },
  -- При первой установке устанавливаем одну из предложенных цветовых схем
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  checker = {
    enabled = true, -- регулярно проверять наличие обновлений плагинов
    notify = false, -- отключаем уведомления об обновлении
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin",
      },
    },
  },
})
