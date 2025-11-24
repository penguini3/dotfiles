return {
  {
    "folke/zen-mode.nvim",
    opts = {},
  },

  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        term_bg = "#0e091d",
      },
      context = 3,
    },
  },

  {
    "preservim/vim-pencil",
    lazy = false,
    init = function()
      vim.g["pencil#wrapModeDefault"] = "soft"
    end,
  },
}
