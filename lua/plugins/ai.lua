return {
  {
    "GeorgesAlkhouri/nvim-aider",
    cmd = {
      "AiderTerminalToggle",
    },
    dependencies = {
      "folke/snacks.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  config = function()
    require("nvim_aider").setup({
      args = {
        "--cache-prompts",
        "--no-stream",
        "--cache-keepalive-pings",
        "6",
      },
    })
  end,
}
