return {
  -- Настройка lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- Использование mini.starter вместо alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
}
