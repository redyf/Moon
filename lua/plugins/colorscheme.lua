return {
  {
    "catppuccin/nvim",
    event = "VeryLazy",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    event = "VeryLazy",
    config = function()
  vim.cmd [[colorscheme rose-pine]]
end,
  },
}
