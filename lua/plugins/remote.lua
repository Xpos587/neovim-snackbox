return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Зафиксировать на релизах GitHub
    dependencies = {
      "nvim-lua/plenary.nvim", -- Для стандартных функций
      "MunifTanjim/nui.nvim", -- Для создания UI плагина
      "nvim-telescope/telescope.nvim", -- Для выбора между удалёнными методами
    },
    config = true,
    opts = {
      log = { level = "debug" },
    },
    cmd = { "RemoteStart", "RemoteInfo", "RemoteLog" },
  },
}
